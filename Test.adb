-- Testing code used in procedures defined in other pachages


with AccountManagementSystem; use AccountManagementSystem;
with Text_IO; use Text_IO;
with Measures; use Measures;

package body Test
      with SPARK_Mode
is
   procedure Print_UserID_Status is
   begin
      Put_Line("Printing every the occupancy of each UserID");
      for I in Users'Range loop
         Put("UserID");
         Put(UserID'Image(I));
         Put("'s status is: ");
         Put_Line(Boolean'Image(Users(I)));
       end loop;
   end Print_UserID_Status;

   procedure Print_Everyones_Friend is
   begin
      Put_Line("Printing every user's friend");
      for I in Friends'Range loop
         Put("UserID");
         Put(UserID'Image(I));
         Put("'s friend is: ");
         Put_Line(UserID'Image(Friends(I)));
      end loop;
   end Print_Everyones_Friend;

   procedure Print_Everyones_Insurer is
   begin
      Put_Line("Printing every user's insurer");
      for I in Insurers'Range loop
         Put("UserID");
         Put(UserID'Image(I));
         Put("'s insurer is: ");
         Put_Line(UserID'Image(Insurers(I)));
         end loop;
      end Print_Everyones_Insurer;

   procedure Print_Everyones_Vitals is
   begin
      Put_Line("Printing every user's current vital reading");
      for I in Vitals'Range loop
         Put("UserID");
         Put( UserID'Image(I));
         Put("'s vital reading is: ");
         Put_Line(BPM'Image(Vitals(I)));
         end loop;
   end Print_Everyones_Vitals;

   procedure Print_Everyones_Footsteps is
   begin
      Put_Line("Printing every user's current footstep reading");
      for I in MFootsteps'Range loop
         Put("UserID");
         Put(UserID'Image(I));
         Put("'s footstep reading is: ");
         Put_Line(Footsteps'Image(MFootsteps(I)));
         end loop;
      end Print_Everyones_Footsteps;

   procedure Print_Everyones_Location is
   begin
      Put_Line("Printing every user's current location");
      for I in Locations'Range loop
         Put("UserID");
         Put(UserID'Image(I));
         Put("'s current location is: (");
         Put(Longitude'Image(Locations(I).Long));
         Put(",");
         Put(Latitude'Image(Locations(I).Lat));
         Put_Line(")");
      end loop;

   end Print_Everyones_Location;

end Test;
