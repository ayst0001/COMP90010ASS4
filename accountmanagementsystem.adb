-- SPARK contract, Task 2.
-- Completed by Qinrui Wang, No.633525
-- This file implementes the interfce and SPARK contract passed from Kun Qin
-- "**" means the code under this comment is added or modified

with Measures; use Measures;
with Ada.Text_IO; use Ada.Text_IO;
with Emergency; use Emergency;

package body AccountManagementSystem
      with SPARK_Mode
is

   procedure Init is
   begin
      -- ** clean all users, clean all relationship records, clean all data
      Users := (others => False);
      Insurers := (others => UserID'First);
      Friends := (others => UserID'First);
      Vitals := (others => BPM'First);
      MFootsteps := (others => Footsteps'First);
      Locations := (others => (0.0, 0.0));
   end Init;

   -- ** Allocate the next available UserID to NewUser
   procedure CreateUser (NewUser : out UserID) is
   begin
     -- ** Pre => LatestUser < UserID'Last,
     -- ** Post => Users(NewUser) = True;
      if LatestUser < UserID'Last then
         Users(LatestUser+1) := True;
         LatestUser := LatestUser + 1;
         NewUser := LatestUser;
      else
         NewUser := UserID'First;
      end if;
   end CreateUser;

   -- ** Set insurer for a wearer
   procedure SetInsurer(Wearer : in UserID; Insurer : in UserID) is
   begin
      -- ** Pre => Wearer in Users'Range and Insurer in Users'Range
         -- ** (VitalsPermissions(Wearer, Insurers'Old(Wearer)) = False)
         -- ** (FootstepsPermissions(Wearer, Insurers'Old(Wearer)) = False)
         -- ** (LocationPermissions(Wearer, Insurers'Old(Wearer)) = False)
         VitalsPermissions(Wearer, Insurers(Wearer)) := False;
         FootstepsPermissions(Wearer, Insurers(Wearer)) := False;
         LocationPermissions(Wearer, Insurers(Wearer)) := False;
         -- ** (Insurers = Insurers'Old'Update(Wearer => Insurer))
         Insurers(Wearer) := Insurer;
         -- ** (FootstepsPermissions = FootstepsPermissions'Old'Update(
         -- ** (Wearer, Insurer), True))
         FootstepsPermissions(Wearer, Insurer) := True;
   end SetInsurer;

   -- ** Remove insurer from a wearer
   procedure RemoveInsurer(Wearer : in UserID) is
   begin
      -- Pre => Insurers(Wearer) /= UserID'First
      if Insurers(Wearer) /= UserID'First then
         -- Post => (Insurers = Insurers'Old'Update(Wearer => UserID'First))
         --         (VitalsPermissions(Wearer, Insurers'Old(Wearer)) = False)
         --         (FootstepsPermissions(Wearer, Insurers'Old(Wearer)) = False)
         --         (LocationPermissions(Wearer, Insurers'Old(Wearer)) = False)
         VitalsPermissions(Wearer, Insurers(Wearer)) := False;
         FootstepsPermissions(Wearer, Insurers(Wearer)) := False;
         LocationPermissions(Wearer, Insurers(Wearer)) := False;
         Insurers(Wearer) := UserID'First;
      end if;
   end RemoveInsurer;

   -- ** Set friend for a wearer
   procedure SetFriend(Wearer : in UserID; Friend : in UserID) is
   begin
      -- ** Pre => Wearer in Users'Range and Friend in Users'Range
      if (Users(Wearer) and Users(Friend)) then
         -- ** (VitalsPermissions(Wearer, Friends'Old(Wearer)) = False)
         -- ** (FootstepsPermissions(Wearer, Friends'Old(Wearer)) = False)
         -- ** (LocationPermissions(Wearer, Friends'Old(Wearer)) = False)
         VitalsPermissions(Wearer,Friends(Wearer)) := False;
         FootstepsPermissions(Wearer, Friends(Wearer)) := False;
         LocationPermissions(Wearer, Friends(Wearer)) := False;
         -- ** (Friends = Friends'Old'Update(Wearer => Friend))
         Friends(Wearer) := Friend;
      -- else
         -- ** Error handling?
         -- ** Put_Line("Wearer or Friend specified does not exist!");
      end if;
   end SetFriend;

   -- ** Remove a friend from a wearer
   procedure RemoveFriend(Wearer : in UserID) is
   begin
      -- Pre => Friends(Wearer) /= UserID'First
      if (Friends(Wearer) /= UserID'First) then
      --   Post => (Friends = Friends'Old'Update(Wearer => UserID'First)) and
      --        (VitalsPermissions(Wearer, Friends'Old(Wearer)) = False) and
      --        (FootstepsPermissions(Wearer, Friends'Old(Wearer)) = False) and
      --        (LocationPermissions(Wearer, Friends'Old(Wearer)) = False);
         VitalsPermissions(Wearer, Friends(Wearer)) := False;
         FootstepsPermissions(Wearer, Friends(Wearer)) := False;
         LocationPermissions(Wearer, Friends(Wearer)) := False;
         Friends(Wearer) := UserID'First;
      end if;
   end RemoveFriend;

   -- ** procedures to update data
   procedure UpdateVitals(Wearer : in UserID; NewVitals : in BPM) is
   begin
      -- ** Pre => Wearer in Users'Range
         -- ** Post => Vitals = Vitals'Old'Update(Wearer => NewVitals)
         Vitals(Wearer) := NewVitals;
   end UpdateVitals;

   procedure UpdateFootsteps(Wearer : in UserID; NewFootsteps : in Footsteps) is
   begin
      -- ** Pre => Wearer in Users'Range
         -- ** Post=>MFootsteps = MFootsteps'Old'Update(Wearer => NewFootsteps)
         MFootsteps(Wearer) := NewFootsteps;
   end UpdateFootsteps;

   procedure UpdateLocation(Wearer : in UserID; NewLocation : in GPSLocation) is
   begin
      -- ** Pre => Wearer in Users'Range
         -- ** Post => Locations = Locations'Old'Update(Wearer => NewLocation)
         Locations(Wearer) := NewLocation;
   end UpdateLocation;

   -- ** Functions to read data from a user
   function ReadVitals_Alt(Requester : in UserID; TargetUser : in UserID)
                           return BPM is
   begin
      -- ** Post => ReadVitals_Alt'Result = (if
      -- **              VitalsPermissions(TargetUser, Requester)= True
      -- **                                     then Vitals(TargetUser)
      -- **                                     else BPM'First);
      if VitalsPermissions(TargetUser, Requester) then
         return Vitals(TargetUser);
      else
         return BPM'First;
      end if;
   end ReadVitals_Alt;

   function ReadFootsteps(Requester : in UserID; TargetUser : in UserID)
                          return Footsteps is
   begin
      -- ** Post => ReadFootsteps'Result = (if
      -- **              FootstepsPermissions(TargetUser, Requester)= True
      -- **                                     then MFootsteps(TargetUser)
      -- **                                     else Footsteps'First);
      if FootstepsPermissions(TargetUser, Requester) then
         return MFootsteps(TargetUser);
      else
         return Footsteps'First;
      end if;
   end ReadFootsteps;

   function ReadLocation(Requester : in UserID; TargetUser : in UserID)
                         return GPSLocation is
   begin
      -- ** Post => ReadLocation'Result = (if
      -- **              LocationPermissions(TargetUser, Requester)= True
      -- **                                     then Locations(TargetUser)
      -- **                                     else (0.0,0.0));
      if LocationPermissions(TargetUser, Requester) then
         return Locations(TargetUser);
      else
         return (0.0,0.0);
      end if;
   end ReadLocation;

   -- ** Procedure to update permissions
   procedure UpdateVitalsPermissions(Wearer : in UserID;
  				     Other : in UserID;
                                     Allow : in Boolean) is
   begin
      -- Pre => Wearer in Users'Range and Other in Users'Range
      if (Users(Wearer) and Users(Other)) then
         -- ** Post => (if Allow = True then (
         -- **         Other = Insurers(Wearer)||
         -- **        Other = Friends(Wearer)||
         -- **         Other = 0)
         -- **       else
         -- **         Other /= Wearer
         -- **      ) and
         -- **      (VitalsPermissions = VitalsPermissions'Old'Update(
         -- **        (Wearer, Other), Allow)
         -- **      );
         If Allow then
            if (Other = Insurers(Wearer) or
                  Other = Friends(Wearer) or
                  Other = 0) then
               if (Other /= Wearer) then
                  VitalsPermissions(Wearer, Other) := True;
               end if;
            end if;
         end if;
      end if;
   end UpdateVitalsPermissions;

   procedure UpdateFootstepsPermissions(Wearer : in UserID;
  					Other : in UserID;
                                        Allow : in Boolean) is
   begin
      -- Pre => Wearer in Users'Range and Other in Users'Range
      if (Users(Wearer) and Users(Other)) then
         -- ** Post => (if Allow = True then (
         -- **         Other = Insurers(Wearer) or
         -- **         Other = Friends(Wearer) or
         -- **         Other = 0)
         -- **       else
         -- **         Other /= Wearer
         -- **         Other /= Insurers(Wearer)     -- ** can see footsteps
         -- **      ) and
         -- **      (FootstepsPermissions = FootstepsPermissions'Old'Update(
         -- **        (Wearer, Other), Allow)
         -- **      );
         if Allow then
            if (Other = Insurers(Wearer) or
                  Other = Friends(Wearer) or
                  Other = 0) then
               if Other /= Wearer and Other /= Insurers(Wearer) then
                  FootstepsPermissions(Wearer, Other) := True;
               end if;
            end if;
         end if;
      end if;
   end UpdateFootstepsPermissions;

   procedure UpdateLocationPermissions(Wearer : in UserID;
  				       Other : in UserID;
                                       Allow : in Boolean) is
   begin
      -- ** Pre => Wearer in Users'Range and Other in Users'Range,
      if (Users(Wearer) and Users(Other)) then
         -- ** Post => (if Allow = True then (
         -- **         Other = Insurers(Wearer) or
         -- **         Other = Friends(Wearer) or
         -- **         Other = 0)
         -- **       else
         -- **         Other /= Wearer and
         -- **         Other /= 0          -- ** emergency always has location
         -- **      ) and
         -- **      (LocationPermissions = LocationPermissions'Old'Update(
         -- **        (Wearer, Other), Allow)
         -- **      );;
         if Allow then
            if Other = Insurers(Wearer) or
              Other = Friends(Wearer) or
              Other = 0 then
               if Other /= Wearer and Other /= 0 then
                  LocationPermissions(Wearer,Other) := True;
               end if;
            end if;
         end if;
      end if;
   end UpdateLocationPermissions;

   -- ** Procedure to contact emergency
   procedure ContactEmergency(Wearer : in UserID;
                            Location : in GPSLocation;
                              Vitals : in BPM) is
   begin
      ContactEmergency(Wearer, Vitals, Location);
   end ContactEmergency;



end AccountManagementSystem;
