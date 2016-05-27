with Measures; use Measures;
with Ada.Text_IO; use Ada.Text_IO;
with AccountManagementSystem;

procedure Run is
   TempUser: UserID;
begin
   AccountManagementSystem.Init;
   AccountManagementSystem.CreateUser(TempUser);
end Run;
