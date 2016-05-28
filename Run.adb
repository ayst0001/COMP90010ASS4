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

   -- ** AccountManagementSystem.CreateUser;


   -- ** AccountManagementSystem.Users(1) := True;
   -- ** AccountManagementSystem.Users(2) := True;
   -- ** Test.Print_UserID_Status;
   -- ** AccountManagementSystem.SetInsurer(1,2);
   -- ** Test.Print_Everyones_Insurer;

end Run;
