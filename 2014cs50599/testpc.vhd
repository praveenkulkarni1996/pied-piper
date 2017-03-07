--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:18:49 03/10/2016
-- Design Name:   
-- Module Name:   C:/Users/DELL/Desktop/CompArch/Assign3/testpc.vhd
-- Project Name:  Assign3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pc
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testpc IS
END testpc;
 
ARCHITECTURE behavior OF testpc IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pc
    PORT(
         toBranch : IN  std_logic;
         PC_in : IN  std_logic_vector(31 downto 0);
         branchOffset : IN  std_logic_vector(23 downto 0);
         PC_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal toBranch : std_logic := '0';
   signal PC_in : std_logic_vector(31 downto 0) := (others => '0');
   signal branchOffset : std_logic_vector(23 downto 0) := (others => '0');

 	--Outputs
   signal PC_out : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pc PORT MAP (
          toBranch => toBranch,
          PC_in => PC_in,
          branchOffset => branchOffset,
          PC_out => PC_out
        );


END;
