with Measures; use Measures;
with Ada.Text_IO; use Ada.Text_IO;
with AccountManagementSystem;
with Test; use Test;

procedure Run is
begin
   AccountManagementSystem.Init;
   -- ** Test.Print_UserID_Status;
   -- ** Test.Print_Everyones_Friend;
   -- ** Test.Print_Everyones_Vitals;
   -- ** Test.Print_Everyones_Footsteps;
   -- ** Test.Print_Everyones_Location;
   Test.Verify_Init;

   -- ** AccountManagementSystem.CreateUser;


   AccountManagementSystem.Users(3) := True;
   AccountManagementSystem.Users(4) := True;
   -- Test.Print_UserID_Status;
   -- AccountManagementSystem.SetInsurer(1,2);
   -- AccountManagementSystem.SetFriend(3,4);
   -- Test.Print_Everyones_Insurer;
   -- Put_Line(UserID'Image(AccountManagementSystem.ReadInsurer(1)));
   -- Put_Line(UserID'Image(AccountManagementSystem.ReadFriend(3)));

   -- AccountManagementSystem.UpdateVitals(3, 102);
   -- Test.Print_Everyones_Vitals;

   -- AccountManagementSystem.UpdateFootsteps(3, 703);
   -- Test.Print_Everyones_Footsteps;

   -- AccountManagementSystem.UpdateLocation(3,(3.5,2.7));
   -- Test.Print_Everyones_Location;

end Run;
