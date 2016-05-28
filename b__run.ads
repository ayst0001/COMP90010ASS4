pragma Ada_95;
with System;
package ada_main is
   pragma Warnings (Off);

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: GPL 2015 (20150428-49)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_run" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#77bbc9a8#;
   pragma Export (C, u00001, "runB");
   u00002 : constant Version_32 := 16#fbff4c67#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#13e2b8e6#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#94f78c67#;
   pragma Export (C, u00004, "accountmanagementsystemB");
   u00005 : constant Version_32 := 16#60503934#;
   pragma Export (C, u00005, "accountmanagementsystemS");
   u00006 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00006, "adaS");
   u00007 : constant Version_32 := 16#12c8cd7d#;
   pragma Export (C, u00007, "ada__tagsB");
   u00008 : constant Version_32 := 16#ce72c228#;
   pragma Export (C, u00008, "ada__tagsS");
   u00009 : constant Version_32 := 16#2130723f#;
   pragma Export (C, u00009, "ada__exceptionsB");
   u00010 : constant Version_32 := 16#f9d4899e#;
   pragma Export (C, u00010, "ada__exceptionsS");
   u00011 : constant Version_32 := 16#a46739c0#;
   pragma Export (C, u00011, "ada__exceptions__last_chance_handlerB");
   u00012 : constant Version_32 := 16#3aac8c92#;
   pragma Export (C, u00012, "ada__exceptions__last_chance_handlerS");
   u00013 : constant Version_32 := 16#100301f7#;
   pragma Export (C, u00013, "systemS");
   u00014 : constant Version_32 := 16#a207fefe#;
   pragma Export (C, u00014, "system__soft_linksB");
   u00015 : constant Version_32 := 16#4b59d020#;
   pragma Export (C, u00015, "system__soft_linksS");
   u00016 : constant Version_32 := 16#b01dad17#;
   pragma Export (C, u00016, "system__parametersB");
   u00017 : constant Version_32 := 16#6e290c88#;
   pragma Export (C, u00017, "system__parametersS");
   u00018 : constant Version_32 := 16#b19b6653#;
   pragma Export (C, u00018, "system__secondary_stackB");
   u00019 : constant Version_32 := 16#bb62ce9e#;
   pragma Export (C, u00019, "system__secondary_stackS");
   u00020 : constant Version_32 := 16#39a03df9#;
   pragma Export (C, u00020, "system__storage_elementsB");
   u00021 : constant Version_32 := 16#3dc04bf3#;
   pragma Export (C, u00021, "system__storage_elementsS");
   u00022 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00022, "system__stack_checkingB");
   u00023 : constant Version_32 := 16#9ebc6a1f#;
   pragma Export (C, u00023, "system__stack_checkingS");
   u00024 : constant Version_32 := 16#393398c1#;
   pragma Export (C, u00024, "system__exception_tableB");
   u00025 : constant Version_32 := 16#be1a67e2#;
   pragma Export (C, u00025, "system__exception_tableS");
   u00026 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00026, "system__exceptionsB");
   u00027 : constant Version_32 := 16#78606c01#;
   pragma Export (C, u00027, "system__exceptionsS");
   u00028 : constant Version_32 := 16#37d758f1#;
   pragma Export (C, u00028, "system__exceptions__machineS");
   u00029 : constant Version_32 := 16#b895431d#;
   pragma Export (C, u00029, "system__exceptions_debugB");
   u00030 : constant Version_32 := 16#a3e11849#;
   pragma Export (C, u00030, "system__exceptions_debugS");
   u00031 : constant Version_32 := 16#570325c8#;
   pragma Export (C, u00031, "system__img_intB");
   u00032 : constant Version_32 := 16#12d8e135#;
   pragma Export (C, u00032, "system__img_intS");
   u00033 : constant Version_32 := 16#b98c3e16#;
   pragma Export (C, u00033, "system__tracebackB");
   u00034 : constant Version_32 := 16#8e3ed82c#;
   pragma Export (C, u00034, "system__tracebackS");
   u00035 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00035, "system__traceback_entriesB");
   u00036 : constant Version_32 := 16#1058f787#;
   pragma Export (C, u00036, "system__traceback_entriesS");
   u00037 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00037, "system__wch_conB");
   u00038 : constant Version_32 := 16#0b7e2325#;
   pragma Export (C, u00038, "system__wch_conS");
   u00039 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00039, "system__wch_stwB");
   u00040 : constant Version_32 := 16#266f0f24#;
   pragma Export (C, u00040, "system__wch_stwS");
   u00041 : constant Version_32 := 16#92b797cb#;
   pragma Export (C, u00041, "system__wch_cnvB");
   u00042 : constant Version_32 := 16#04c999d6#;
   pragma Export (C, u00042, "system__wch_cnvS");
   u00043 : constant Version_32 := 16#6033a23f#;
   pragma Export (C, u00043, "interfacesS");
   u00044 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00044, "system__wch_jisB");
   u00045 : constant Version_32 := 16#84b980f7#;
   pragma Export (C, u00045, "system__wch_jisS");
   u00046 : constant Version_32 := 16#c3335bfd#;
   pragma Export (C, u00046, "system__htableB");
   u00047 : constant Version_32 := 16#94c1b21d#;
   pragma Export (C, u00047, "system__htableS");
   u00048 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00048, "system__string_hashB");
   u00049 : constant Version_32 := 16#369fd963#;
   pragma Export (C, u00049, "system__string_hashS");
   u00050 : constant Version_32 := 16#8d5ba537#;
   pragma Export (C, u00050, "system__unsigned_typesS");
   u00051 : constant Version_32 := 16#06052bd0#;
   pragma Export (C, u00051, "system__val_lluB");
   u00052 : constant Version_32 := 16#f7a9f245#;
   pragma Export (C, u00052, "system__val_lluS");
   u00053 : constant Version_32 := 16#27b600b2#;
   pragma Export (C, u00053, "system__val_utilB");
   u00054 : constant Version_32 := 16#bca3b709#;
   pragma Export (C, u00054, "system__val_utilS");
   u00055 : constant Version_32 := 16#d1060688#;
   pragma Export (C, u00055, "system__case_utilB");
   u00056 : constant Version_32 := 16#340a6820#;
   pragma Export (C, u00056, "system__case_utilS");
   u00057 : constant Version_32 := 16#28f088c2#;
   pragma Export (C, u00057, "ada__text_ioB");
   u00058 : constant Version_32 := 16#fe568dda#;
   pragma Export (C, u00058, "ada__text_ioS");
   u00059 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00059, "ada__streamsB");
   u00060 : constant Version_32 := 16#2e6701ab#;
   pragma Export (C, u00060, "ada__streamsS");
   u00061 : constant Version_32 := 16#db5c917c#;
   pragma Export (C, u00061, "ada__io_exceptionsS");
   u00062 : constant Version_32 := 16#84a27f0d#;
   pragma Export (C, u00062, "interfaces__c_streamsB");
   u00063 : constant Version_32 := 16#8bb5f2c0#;
   pragma Export (C, u00063, "interfaces__c_streamsS");
   u00064 : constant Version_32 := 16#6092d7f9#;
   pragma Export (C, u00064, "system__crtlS");
   u00065 : constant Version_32 := 16#431faf3c#;
   pragma Export (C, u00065, "system__file_ioB");
   u00066 : constant Version_32 := 16#b772e092#;
   pragma Export (C, u00066, "system__file_ioS");
   u00067 : constant Version_32 := 16#b7ab275c#;
   pragma Export (C, u00067, "ada__finalizationB");
   u00068 : constant Version_32 := 16#19f764ca#;
   pragma Export (C, u00068, "ada__finalizationS");
   u00069 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00069, "system__finalization_rootB");
   u00070 : constant Version_32 := 16#5ff17267#;
   pragma Export (C, u00070, "system__finalization_rootS");
   u00071 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00071, "interfaces__cB");
   u00072 : constant Version_32 := 16#4a38bedb#;
   pragma Export (C, u00072, "interfaces__cS");
   u00073 : constant Version_32 := 16#0ac2ab10#;
   pragma Export (C, u00073, "system__os_libB");
   u00074 : constant Version_32 := 16#d7b69782#;
   pragma Export (C, u00074, "system__os_libS");
   u00075 : constant Version_32 := 16#1a817b8e#;
   pragma Export (C, u00075, "system__stringsB");
   u00076 : constant Version_32 := 16#6ebc1091#;
   pragma Export (C, u00076, "system__stringsS");
   u00077 : constant Version_32 := 16#ed9c9b5f#;
   pragma Export (C, u00077, "system__file_control_blockS");
   u00078 : constant Version_32 := 16#7e180b3d#;
   pragma Export (C, u00078, "measuresS");
   u00079 : constant Version_32 := 16#baa20eb5#;
   pragma Export (C, u00079, "testB");
   u00080 : constant Version_32 := 16#a03f0ec5#;
   pragma Export (C, u00080, "testS");
   u00081 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00081, "system__img_boolB");
   u00082 : constant Version_32 := 16#e5da701c#;
   pragma Export (C, u00082, "system__img_boolS");
   u00083 : constant Version_32 := 16#f0df9003#;
   pragma Export (C, u00083, "system__img_realB");
   u00084 : constant Version_32 := 16#d7ab5015#;
   pragma Export (C, u00084, "system__img_realS");
   u00085 : constant Version_32 := 16#1494ba04#;
   pragma Export (C, u00085, "system__fat_llfS");
   u00086 : constant Version_32 := 16#1b28662b#;
   pragma Export (C, u00086, "system__float_controlB");
   u00087 : constant Version_32 := 16#f0ff42cb#;
   pragma Export (C, u00087, "system__float_controlS");
   u00088 : constant Version_32 := 16#f1f88835#;
   pragma Export (C, u00088, "system__img_lluB");
   u00089 : constant Version_32 := 16#c492a5f4#;
   pragma Export (C, u00089, "system__img_lluS");
   u00090 : constant Version_32 := 16#eef535cd#;
   pragma Export (C, u00090, "system__img_unsB");
   u00091 : constant Version_32 := 16#12af99c0#;
   pragma Export (C, u00091, "system__img_unsS");
   u00092 : constant Version_32 := 16#40736780#;
   pragma Export (C, u00092, "system__powten_tableS");
   u00093 : constant Version_32 := 16#7dbbd31d#;
   pragma Export (C, u00093, "text_ioS");
   u00094 : constant Version_32 := 16#9d39c675#;
   pragma Export (C, u00094, "system__memoryB");
   u00095 : constant Version_32 := 16#497e67c3#;
   pragma Export (C, u00095, "system__memoryS");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  interfaces%s
   --  system%s
   --  system.case_util%s
   --  system.case_util%b
   --  system.float_control%s
   --  system.float_control%b
   --  system.htable%s
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_real%s
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.powten_table%s
   --  system.standard_library%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.os_lib%s
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  ada.exceptions%s
   --  system.soft_links%s
   --  system.unsigned_types%s
   --  system.fat_llf%s
   --  system.img_llu%s
   --  system.img_llu%b
   --  system.img_uns%s
   --  system.img_uns%b
   --  system.img_real%b
   --  system.val_llu%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_llu%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_cnv%s
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.io_exceptions%s
   --  ada.tags%s
   --  ada.streams%s
   --  ada.streams%b
   --  interfaces.c%s
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.exceptions.machine%s
   --  system.file_control_block%s
   --  system.file_io%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  ada.finalization%b
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.secondary_stack%s
   --  system.file_io%b
   --  interfaces.c%b
   --  ada.tags%b
   --  system.soft_links%b
   --  system.os_lib%b
   --  system.secondary_stack%b
   --  system.traceback%s
   --  ada.exceptions%b
   --  system.traceback%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  text_io%s
   --  measures%s
   --  accountmanagementsystem%s
   --  test%s
   --  test%b
   --  accountmanagementsystem%b
   --  run%b
   --  END ELABORATION ORDER


end ada_main;
