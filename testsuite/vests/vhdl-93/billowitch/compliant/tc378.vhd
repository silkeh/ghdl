
-- Copyright (C) 2001 Bill Billowitch.

-- Some of the work to develop this test suite was done with Air Force
-- support.  The Air Force and Bill Billowitch assume no
-- responsibilities for this software.

-- This file is part of VESTs (Vhdl tESTs).

-- VESTs is free software; you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by the
-- Free Software Foundation; either version 2 of the License, or (at
-- your option) any later version. 

-- VESTs is distributed in the hope that it will be useful, but WITHOUT
-- ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-- FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-- for more details. 

-- You should have received a copy of the GNU General Public License
-- along with VESTs; if not, write to the Free Software Foundation,
-- Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 

-- ---------------------------------------------------------------------
--
-- $Id: tc378.vhd,v 1.2 2001-10-26 16:29:53 paw Exp $
-- $Revision: 1.2 $
--
-- ---------------------------------------------------------------------

ENTITY c03s02b01x01p03n03i00378ent IS
END c03s02b01x01p03n03i00378ent;

ARCHITECTURE c03s02b01x01p03n03i00378arch OF c03s02b01x01p03n03i00378ent IS
  type       M1 is array (positive range <>) of integer;
  subtype    M2 is M1 (2 to 200);    -- No_failure_here
BEGIN
  TESTING: PROCESS
    variable k : M2;
  BEGIN
    k(2)   := 2;
    k(200) := 200;
    assert NOT (   k(2) = 2 and 
                   k(200) = 200) 
      report "***PASSED TEST: c03s02b01x01p03n03i00378"
      severity NOTE;
    assert  (   k(2) = 2 and 
                k(200) = 200) 
      report "***FAILED TEST: c03s02b01x01p03n03i00378 - The index constraint must provide a discrete range for each index of the array type."
      severity ERROR;
    wait;
  END PROCESS TESTING;

END c03s02b01x01p03n03i00378arch;
