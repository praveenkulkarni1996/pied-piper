library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity DataPath is
	port(
		clk : in std_logic ;
		pcIn : in std_logic_vector(31 downto 0);	-- Input to PC
		toWrite : in std_logic;
		isExecute : in std_logic;
		toPcWrite : in std_logic;
		toBranch : in std_logic;
		wad : in std_logic_vector(3 downto 0);
		wd : in std_logic_vector(31 downto 0);
		Cin : in std_logic;
		--isExecute, toBranch, pcWrEn : in std_logic := (others => '1');
		alu_result : out std_logic_vector(31 downto 0);
		N_out, Z_out, C_out, V_out : out std_logic;
		toLoad,  data_wea : in std_logic_vector(0 downto 0)
	);
end DataPath;

architecture Behavioral of DataPath is

	component ProgCounter
	PORT(
		clk : in std_logic;
		pcIn : in std_logic_vector(31 downto 0);
		pcOut : out std_logic_vector(31 downto 0);
		pcEn : in std_logic
	);
	end component;
	
	component bram 
	PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
	end component;
	
	component registerFile 
	PORT (
		clk : in std_logic;
		toWrite : in std_logic;
		rad1, rad2 : in std_logic_vector(3 downto 0);
		wad : in std_logic_vector(3 downto 0);
		wd : in std_logic_vector(31 downto 0);
		rd1, rd2 : out std_logic_vector(31 downto 0)
	);
	end component;
	
	component alu
	port(
		op1, Rm: in std_logic_vector(31 downto 0);
		imm32 : in std_logic_vector(11 downto 0);
		Cin : in std_logic;
		alu_opcode: in std_logic_vector(3 downto 0);
		alu_result: out std_logic_vector(31 downto 0);
		alu_N_out : OUT  std_logic;
      alu_Z_out : OUT  std_logic;
      alu_C_out : OUT  std_logic;
      alu_V_out : OUT  std_logic;
		isExecute, isDT, isMul ,isImmediate: in std_logic);	
	end component;
	
	component statusRegister
	port(
	clk : in std_logic;
	S   : in std_logic; 
	N_in : in std_logic;
	Z_in : in std_logic;
	C_in : in std_logic;
	V_in : in std_logic;
	N_out : out std_logic;
	Z_out : out std_logic;
	C_out : out std_logic;
	V_out : out std_logic
	);
	end component;
	
	component dataMemoryRAM
	 PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
	end component;
	
	component pc 
	port(
		toBranch: in std_logic;
		PC_in: in std_logic_vector(31 downto 0);
		branchOffset: in std_logic_vector(23 downto 0);
		PC_out: out std_logic_vector(31 downto 0));
	end component;

	signal sig_pcIn  : std_logic_vector(31 downto 0);	
	signal sig_pcOut : std_logic_vector(31 downto 0);
	
	signal sig_inst : std_logic_vector(31 downto 0);
	signal sig_rad1 : std_logic_vector(3 downto 0);
	signal sig_rad2 : std_logic_vector(3 downto 0);
	signal sig_wad : std_logic_vector(3 downto 0);
	signal sig_wd : std_logic_vector(31 downto 0);
	signal sig_aluResult :std_logic_vector(31 downto 0);
	signal sig_rd1 : std_logic_vector(31 downto 0);
	signal sig_rd2 : std_logic_vector(31 downto 0);
	signal sig_N, sig_Z, sig_C, sig_V : std_logic;
	signal sig_Cin : std_logic;
	signal sig_dataOut : std_logic_vector(31 downto 0);
	signal sig_isMul : std_logic;
	
	

begin	
	
	ProgramCounter: ProgCounter PORT MAP (
			pcEn => toPcWrite,
			clk => clk,
			pcIn => sig_pcIn,
			pcOut => sig_pcOut
			);
	
	PCIncrement : pc PORT MAP (
			toBranch => toBranch,
			PC_in => sig_pcOut,
			branchOffset => sig_inst(23 downto 0),
			PC_out => sig_pcIn
			);
	
	IM: bram PORT MAP (
			clka => clk,
			wea => "0",
			addra => sig_pcOut(6 downto 0),
			dina => "00000000000000000000000000000000",
			douta => sig_inst
			);

	sig_rad1 <= sig_inst(19 downto 16);
	sig_rad2 <= sig_inst(3 downto 0);
	sig_wad <= sig_inst(15 downto 12);
	
	RF: registerFile PORT MAP (
			clk => clk,
			toWrite => toWrite,
			rad1 => sig_rad1,
			rad2 => sig_rad2,
			wad => sig_wad,
			wd => sig_wd,
			rd1 => sig_rd1,
			rd2 => sig_rd2
			);
	
	sig_isMul <= '1' when (sig_inst(26) = '0' and sig_inst(25) = '0' and sig_inst(4) = '1') else '0';
	ALU_obj : alu PORT MAP(
			op1 => sig_rd1, 
			Rm  => sig_rd2,
			imm32 => sig_inst(11 downto 0),
			Cin => sig_Cin,
			alu_opcode => sig_inst(24 downto 21),
			alu_result => sig_aluResult,
			alu_N_out => sig_N, 
			alu_Z_out => sig_Z,
			alu_C_out => sig_C,
			alu_V_out => sig_V,
			isExecute => isExecute,
			isDT => sig_inst(26),
			isMul => sig_isMul,
			isImmediate => sig_inst(25)
		);
		
	alu_result <= sig_aluResult;
			
	FLAGS: statusRegister PORT MAP (
			clk => clk,
			S   => sig_inst(20),
			N_in => sig_N,
			Z_in => sig_Z,
			C_in => sig_C,
			V_in => sig_V,
			N_out => N_out,
			Z_out => Z_out,
			C_out => sig_Cin,
			V_out => V_out	
			);
	C_out <= sig_Cin;
	
	DM: dataMemoryRAM PORT MAP (
		   clka => clk,
			wea => data_wea,
			addra => sig_aluResult(4 downto 0),
			dina => sig_rd1,
			douta => sig_dataOut
	);

	sig_wd <= sig_dataOut when toLoad = "1" else sig_aluResult;
	
end Behavioral;