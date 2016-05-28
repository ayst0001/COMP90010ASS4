-- SPARK contract, Task 2.
-- Completed by team member two: implement package body for given interface
-- "**" means the code under this comment is added or modified

with Measures; use Measures;
with Ada.Text_IO; use Ada.Text_IO;
with Test;

package body AccountManagementSystem
      with SPARK_Mode
is

   procedure Init is
   begin
      -- ** Put_Line("Initializing system");

      -- ** Post => (for all I in Users'Range => Users(I) = False),
      for I in Users'Range loop
         Users(I) := False;
      end loop;

      -- ** Reset all users' friend to -1
      -- ** (for all I in Friends'Range => Friends(I) = UserID'First)
      for I in Friends'Range loop
         Friends(I) := UserID'First;
      end loop;

      -- ** Reset Vital records
      -- **(for all I in Vitals'Range => Vitals(I) = BPM'First)
      for I in Vitals'Range loop
         Vitals(I) := BPM'First;
      end loop;

      -- ** Reset Footsteps records
      -- ** (for all I in MFootsteps'Range => MFootsteps(I) = Footsteps'First)
      for I in MFootsteps'Range loop
         MFootsteps(I) := Footsteps'First;
      end loop;

      -- ** Reset location records
      -- ** (for all I in Locations'Range => Locations(I) = (0.0, 0.0))
      for I in Locations'Range loop
         Locations(I) := (0.0,0.0);
      end loop;

      -- ** Put_Line("Initialization finished");
   end Init;

--   procedure CreateUser (NewUser : out UserID) is
--   begin
     -- ** Pre => LatestUser < UserID'Last,
     -- ** Post => Users(NewUser) = True;
--      if LatestUser < UserID'Last then
--         Users(LatestUser) := True;
--         NewUser := LatestUser;
--      end if;
--      Test.Print_UserID_Status;
--   end CreateUser;

   procedure SetInsurer(Wearer : in UserID; Insurer : in UserID) is
   begin
      -- ** Pre => Wearer in Users'Range and Insurer in Users'Range
      if (Users(Wearer) and Users(Insurer)) then
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
      -- else
         -- ** Error handling?
         -- Put_Line("Wearer or Insurer specified does not exist!");
         end if;
      end SetInsurer;

end AccountManagementSystem;
