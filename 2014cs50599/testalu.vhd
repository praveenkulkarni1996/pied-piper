--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:47:53 03/11/2016
-- Design Name:   
-- Module Name:   C:/Users/quantumcoder/Desktop/iitd/Sem4/col216/assignments/assignment3/CompArch/Assign3/testALU.vhd
-- Project Name:  Assign3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: alu
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
 
ENTITY testALU IS
END testALU;
 
ARCHITECTURE behavior OF testALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu
    PORT(
         op1 : IN  std_logic_vector(31 downto 0);
         Rm : IN  std_logic_vector(31 downto 0);
         imm32 : IN  std_logic_vector(11 downto 0);
         Cin : IN  std_logic;
         alu_opcode : IN  std_logic_vector(3 downto 0);
         alu_result : OUT  std_logic_vector(31 downto 0);
         alu_N_out : OUT  std_logic;
         alu_Z_out : OUT  std_logic;
         alu_C_out : OUT  std_logic;
         alu_V_out : OUT  std_logic;
         isExecute : IN  std_logic;
         isDT : IN  std_logic;
         isMul : IN  std_logic;
         isImmediate : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal op1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Rm : std_logic_vector(31 downto 0) := (others => '0');
   signal imm32 : std_logic_vector(11 downto 0) := (others => '0');
   signal Cin : std_logic := '0';
   signal alu_opcode : std_logic_vector(3 downto 0) := (others => '0');
   signal isExecute : std_logic := '0';
   signal isDT : std_logic := '0';
   signal isMul : std_logic := '0';
   signal isImmediate : std_logic := '0';

 	--Outputs
   signal alu_result : std_logic_vector(31 downto 0);
   signal alu_N_out : std_logic;
   signal alu_Z_out : std_logic;
   signal alu_C_out : std_logic;
   signal alu_V_out : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alu PORT MAP (
          op1 => op1,
          Rm => Rm,
          imm32 => imm32,
          Cin => Cin,
          alu_opcode => alu_opcode,
          alu_result => alu_result,
          alu_N_out => alu_N_out,
          alu_Z_out => alu_Z_out,
          alu_C_out => alu_C_out,
          alu_V_out => alu_V_out,
          isExecute => isExecute,
          isDT => isDT,
          isMul => isMul,
          isImmediate => isImmediate
        );

END;
