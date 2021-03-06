/* Copyright 2017 Siddhartha Das (bablu.boy@gmail.com)
*
* This file is part of Bookworm and entry point to the
* application with the main method
*
* Bookworm is free software: you can redistribute it
* and/or modify it under the terms of the GNU General Public License as
* published by the Free Software Foundation, either version 3 of the
* License, or (at your option) any later version.
*
* Bookworm is distributed in the hope that it will be
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
* Public License for more details.
*
* You should have received a copy of the GNU General Public License along
* with Bookworm. If not, see http://www.gnu.org/licenses/.
*/
BookwormApp.Bookworm application;
public static int main (string[] args) {
    Environment.set_variable ("G_MESSAGES_DEBUG", "all", true);
    //Get an instance of Bookworm if is running, otherwise create a new instance
    application = BookwormApp.Bookworm.getAppInstance ();
    //Workaround to get Granite's --about & Gtk's --help working together
    if ("--help"     in args || "-h" in args ||
        "--version"  in args ||
        "--discover" in args)
    {
        return application.processCommandLine (args);
    } else {
        Gtk.init (ref args);
        if ("--debug" in args) {
            application.command_line_option_debug = true;
        }
        if ("--info" in args) {
            application.command_line_option_info = true;
        }
        return application.run (args);
    }
}
