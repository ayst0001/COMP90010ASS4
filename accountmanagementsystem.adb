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
      Put_Line("Initializing system");

      -- ** Post => (for all I in Users'Range => Users(I) = False),
      for I in Users'Range loop
         Users(I) := False;
      end loop;
      -- ** Test.Print_UserID_Status;

      -- ** Reset all users' friend to -1
      -- ** (for all I in Friends'Range => Friends(I) = UserID'First)
      for I in Friends'Range loop
         Friends(I) := UserID'First;
      end loop;
      -- ** Test.Print_Everyones_Friend;

      -- ** Reset Vital records
      -- **(for all I in Vitals'Range => Vitals(I) = BPM'First)
      for I in Vitals'Range loop
         Vitals(I) := BPM'First;
      end loop;
      -- ** Test.Print_Everyones_Vitals;

      -- ** Reset Footsteps records
      -- ** (for all I in MFootsteps'Range => MFootsteps(I) = Footsteps'First)
      for I in MFootsteps'Range loop
         MFootsteps(I) := Footsteps'First;
      end loop;
      -- ** Test.Print_Everyones_Footsteps;

      for I in Locations'Range loop
         Locations(I) := (0.0,0.0);
      end loop;
      Test.Print_Everyones_Location;
      -- (for all I in Locations'Range => Locations(I) = (0.0, 0.0));
      Put_Line("Initialization finished");
   end Init;

end AccountManagementSystem;
