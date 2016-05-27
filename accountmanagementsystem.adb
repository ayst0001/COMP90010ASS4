-- SPARK contract, Task 2.
-- Completed by team member two: implement package body for given interface
-- "**" means the code under this comment is added or modified

with Measures; use Measures;
with Ada.Text_IO; use Ada.Text_IO;

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
-- ** Testing code:
-- **       for I in Users'Range loop
-- **          Put(UserID'Image(I));
-- **          Put_Line(Boolean'Image(Users(I)));
-- **       end loop;

-- ** Reset all users' friend to -1
-- ** (for all I in Friends'Range => Friends(I) = UserID'First) and
      for I in Friends'Range loop
         Friends(I) := UserID'First;
      end loop;
-- ** Testing code:
-- **      for I in Friends'Range loop
-- **         Put(UserID'Image(I));
-- **         Put_Line(UserID'Image(Friends(I)));
-- **      end loop;


      -- (for all I in Vitals'Range => Vitals(I) = BPM'First) and
      -- (for all I in MFootsteps'Range => MFootsteps(I) = Footsteps'First) and
      -- (for all I in Locations'Range => Locations(I) = (0.0, 0.0));
      Put_Line("Initialization finished");
   end Init;

end AccountManagementSystem;
