------------------------------------------------------------------------------------------------------------------------
--  Copyright 2024 Cre8or                                                                                             --
--                                                                                                                    --
--  Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance    --
--  with the License. You may obtain a copy of the License at                                                         --
--                                                                                                                    --
--     http://www.apache.org/licenses/LICENSE-2.0                                                                     --
--                                                                                                                    --
--  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed  --
--  on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.                     --
--  See the License for the specific language governing permissions and limitations under the License.                --
------------------------------------------------------------------------------------------------------------------------





with Interfaces.C;
with System;



pragma Elaborate_All (Interfaces.C);
pragma Elaborate_All (System);





package Cre8or_Raw_Window_Handle is



	-- Types
	type T_Kind is (
		E_AppKit,
		E_Windows,
		E_Xlib,
		E_Xcb,
		E_Wayland
	);

	type T_Handle (Kind : T_Kind) is record
		case Kind is
			when E_AppKit =>
				appkit_ns_view : System.Address := System.Null_Address;

			when E_Windows =>
				win_hwnd      : System.Address := System.Null_Address;
				win_hinstance : System.Address := System.Null_Address;

			when E_Xlib =>
				xlib_display   : System.Address             := System.Null_Address;
				xlib_screen    : Interfaces.C.int           := 0;
				xlib_window    : Interfaces.C.unsigned_long := 0;
				xlib_visual_id : Interfaces.C.unsigned_long := 0;

			when E_Xcb =>
				xcb_connection : System.Address             := System.Null_Address;
				xcb_screen     : Interfaces.C.int           := 0;
				xcb_window     : Interfaces.C.unsigned_long := 0;
				xcb_visual_id  : Interfaces.C.unsigned_long := 0;

			when E_Wayland =>
				wayland_display : System.Address := System.Null_Address;
				wayland_surface : System.Address := System.Null_Address;

		end case;
	end record;



end Cre8or_Raw_Window_Handle;
