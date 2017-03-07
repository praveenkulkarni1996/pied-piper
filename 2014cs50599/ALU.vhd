library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.shift_left;
use work.my_utility.all;

entity alu is
	port(
		op1, Rm: in std_logic_vector(31 downto 0);
		imm32 : in std_logic_vector(11 downto 0);
	
		Cin:in std_logic;
		alu_opcode: in std_logic_vector(3 downto 0);
		alu_result: out std_logic_vector(31 downto 0);
		alu_N_out : OUT  std_logic;
      alu_Z_out : OUT  std_logic;
      alu_C_out : OUT  std_logic;
      alu_V_out : OUT  std_logic;
		isExecute, isDT, isMul ,isImmediate: in std_logic);
end entity alu;

architecture Behavioral of alu is
	signal Atemp, Btemp: std_logic_vector(31 downto 0);
	signal A, B: std_logic_vector(32 downto 0);
	signal alu_result_temp : std_logic_vector(32 downto 0);
	signal preShift: std_logic_vector(31 downto 0); 
	signal shiftAmt: std_logic_vector(4 downto 0);
	signal immediate : std_logic_vector(31 downto 0);
	signal op2 : std_logic_vector(31 downto 0);
	signal imm5 : std_logic_vector (4 downto 0);
	signal shiftType : std_logic_vector(1 downto 0);
	signal imm12 : std_logic_vector(32 downto 0);
	signal product : std_logic_vector(64 downto 0);
	signal A_overflow_temp : std_logic_vector(30 downto 0);
	signal B_overflow_temp : std_logic_vector(30 downto 0);
	signal A_overflow : std_logic_vector(31 downto 0);
	signal B_overflow : std_logic_vector(31 downto 0);
	signal overflow_result : std_logic_vector(31 downto 0);
begin
	imm5 <= imm32(11 downto 7);
	shiftType <= imm32(6 downto 5);
	imm12 <= "111111111111111111111" & imm32 when imm32(11) = '1' else  "000000000000000000000" & imm32;
	op2 <= to_stdlogicvector(to_bitvector(Rm) sll to_int(to_bitvector(imm5))) when (shiftType = "00") else
			 to_stdlogicvector(to_bitvector(Rm) srl to_int(to_bitvector(imm5))) when (shiftType = "01") else
			 to_stdlogicvector(to_bitvector(Rm) sra to_int(to_bitvector(imm5))) when (shiftType = "10") else
			 to_stdlogicvector(to_bitvector(Rm) ror to_int(to_bitvector(imm5))) ;

	preShift <= "000000000000000000000000" & imm32(7 downto 0);
	shiftAmt <= imm32(11 downto 8) & '0';
	immediate <= to_stdlogicvector(to_bitvector(preShift) ror to_int(to_bitvector(ShiftAmt))) ;
	Atemp <= op1;
	Btemp <= immediate when isImmediate='1' else op2;
	A <= '0' & Atemp when Atemp(31) = '0' else '1' & Atemp;
	B <= '0' & Btemp when Btemp(31) = '0' else '1' & Btemp;
	product <= (A * Rm);
		 
	alu_result_temp <= 
		(A + imm12) when (isDT ='1' and isExecute='1') else
		product(31 downto 0) when (isMul ='1' and isExecute='1') else
		(A and B) when (alu_opcode= "0000" and isExecute='1') else
		(A xor B) when (alu_opcode= "0001" and isExecute='1') else
		(A - B) when (alu_opcode= "0010" and isExecute='1') else
		(B - A) when (alu_opcode= "0011" and isExecute='1') else
		(A + B) when (alu_opcode= "0100" and isExecute='1') else
		(A + B) + Cin when (alu_opcode= "0101" and isExecute='1') else
		(A - B) + Cin -1 when (alu_opcode= "0110" and isExecute='1') else
		(B - A) + Cin -1 when (alu_opcode= "0111" and isExecute='1') else
		(A and B) when (alu_opcode= "1000" and isExecute='1') else
		(A xor B) when (alu_opcode= "1001" and isExecute='1') else
		(A - B) when (alu_opcode= "1010" and isExecute='1') else
		(A + B) when (alu_opcode= "1011" and isExecute='1') else
		(A or B) when (alu_opcode= "1100" and isExecute='1') else
		(B) when (alu_opcode= "1101" and isExecute='1') else
		(A and (not B)) when (alu_opcode= "1110" and isExecute='1') else
		(not B) when(alu_opcode= "1111" and isExecute='1');
		
	alu_result <= alu_result_temp(31 downto 0);
	
	alu_N_out <= alu_result_temp(31);
	alu_Z_out <= '1' when alu_result_temp(31 downto 0) = "00000000000000000000000000000000" else '0';
	alu_C_out <= alu_result_temp(32);
	
	A_overflow_temp <= A(30 downto 0);
	A_overflow <= '0' & A_overflow_temp when A(30)='0' else '1' & A_overflow_temp;
	
	B_overflow_temp <= B(30 downto 0);
	B_overflow <= '0' & B_overflow_temp when B(30)='0' else '1' & B_overflow_temp;
	
	overflow_result <= 
		(A_overflow - B_overflow) when (alu_opcode= "0010" and isExecute='1') else
		(B_overflow - A_overflow) when (alu_opcode= "0011" and isExecute='1') else
		(A_overflow + B_overflow) when (alu_opcode= "0100" and isExecute='1') else
		(A_overflow + B_overflow) + Cin when (alu_opcode= "0101" and isExecute='1') else
		(A_overflow - B_overflow) + Cin -1 when (alu_opcode= "0110" and isExecute='1') else
		(B_overflow - A_overflow) + Cin -1 when (alu_opcode= "0111" and isExecute='1') else
		(A_overflow - B_overflow) when (alu_opcode= "1010" and isExecute='1') else
		(A_overflow + B_overflow) when (alu_opcode= "1011" and isExecute='1') else
		"00000000000000000000000000000000";
	
	alu_V_out <= overflow_result(31);

end Behavioral;