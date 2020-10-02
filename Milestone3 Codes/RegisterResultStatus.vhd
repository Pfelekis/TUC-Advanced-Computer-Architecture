----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:01:44 10/28/2017 
-- Design Name: 
-- Module Name:    RegisterResultStatus - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegisterResultStatus is
    Port ( 
			  clk   : in std_logic;
			  reset : in  STD_LOGIC;
			  din : in std_logic_vector ( 4 downto 0);
           tag : in  STD_LOGIC_VECTOR (4 downto 0);
           Q : in  STD_LOGIC_VECTOR (4 downto 0);
           Qout : out  STD_LOGIC_VECTOR (4 downto 0);
			  Q2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Qout2 : out  STD_LOGIC_VECTOR (4 downto 0));
end RegisterResultStatus;

architecture Behavioral of RegisterResultStatus is

component Mux2_2 is
    Port ( Sel : in  STD_LOGIC;
           InM1 : in  STD_LOGIC_VECTOR (4 downto 0);
           InM2 : in  STD_LOGIC_VECTOR (4 downto 0);
           OutM : out  STD_LOGIC_VECTOR (4 downto 0));
end component;

component Compare is
    Port ( InC1 : in  STD_LOGIC_VECTOR (4 downto 0);
           InC2 : in  STD_LOGIC_VECTOR (4 downto 0);
           OutC : out  STD_LOGIC);
end component;

component Mux32_5 is
 Port ( 	  Re0  : in  STD_LOGIC_VECTOR (4 downto 0);
           Re1  : in  STD_LOGIC_VECTOR (4 downto 0);
           Re2  : in  STD_LOGIC_VECTOR (4 downto 0);
           Re3  : in  STD_LOGIC_VECTOR (4 downto 0);
           Re4  : in  STD_LOGIC_VECTOR (4 downto 0);
           Re5  : in  STD_LOGIC_VECTOR (4 downto 0);
           Re6  : in  STD_LOGIC_VECTOR (4 downto 0);
           Re7  : in  STD_LOGIC_VECTOR (4 downto 0);
           Re8  : in  STD_LOGIC_VECTOR (4 downto 0);
           Re9  : in  STD_LOGIC_VECTOR (4 downto 0);
           Re10 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re11 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re12 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re13 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re14 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re15 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re16 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re17 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re18 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re19 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re20 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re21 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re22 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re23 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re24 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re25 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re26 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re27 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re28 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re29 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re30 : in  STD_LOGIC_VECTOR (4 downto 0);
           Re31 : in  STD_LOGIC_VECTOR (4 downto 0);
           SEL  : in  STD_LOGIC_VECTOR (4 downto 0);
           Dout : out STD_LOGIC_VECTOR (4 downto 0));
end component;

component Reg32 is
    Port ( Data : in  STD_LOGIC_VECTOR (31 downto 0);
           Clk : in  STD_LOGIC;
           WE : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


component Reg5 is
		Port ( Data : in  STD_LOGIC_VECTOR (4 downto 0);
             CLK : in  STD_LOGIC;
             Dout : out  STD_LOGIC_VECTOR (4 downto 0);
				 reset : in std_logic;
             Enable : in  STD_LOGIC);
end component;

component Decoder is
    Port ( InD : in  STD_LOGIC_VECTOR (4 downto 0);
           OutD : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal end1,end2,mux_out1,mux_out2,reg_out0,reg_out1,reg_out2,reg_out3,reg_out4,reg_out5,reg_out6,reg_out7,reg_out8,reg_out9,reg_out10,reg_out11,reg_out12,reg_out13,reg_out14,reg_out15,reg_out16,reg_out17,reg_out18,reg_out19,reg_out20,reg_out21,reg_out22,reg_out23,reg_out24,reg_out25,reg_out26,reg_out27,reg_out28,reg_out29,reg_out30,reg_out31 : std_logic_vector (4 downto 0);
signal en : std_logic_vector (31 downto 0);
signal comp_out1,comp_out2,co_mux1,co_mux2 : std_logic;

begin


						  Dec : Decoder port map ( InD => tag,
						  OutD => en);

						  Reg5_0 : Reg5 port map ( Data =>din,
						  enable => en(0),
						  Clk => Clk,
						  reset =>reset,
						  Dout => reg_out0);
						  
						  Reg5_1 :	Reg5 port map ( Data => din,
						  reset =>reset,
						  enable=> en(1),
						  Clk => Clk,
						  Dout => reg_out1);
						  
						  Reg5_2 :	Reg5 port map ( Data => din,
						  enable => en(2),
						  reset =>reset,
						  Clk => Clk,
						  Dout => reg_out2);
						  
						  Reg5_3 :	Reg5 port map ( Data => din,
						  enable => en(3),
						  reset =>reset,
						  Clk => Clk,
						  Dout => reg_out3);
						  
						  Reg5_4 :	Reg5 port map ( Data => din,
						  enable => en(4),
						  Clk => Clk,
						  reset =>reset,
						  Dout => reg_out4);
						  
						  Reg5_5 :	Reg5 port map ( Data => din,
						  enable => en(5),
						  Clk => Clk,
						  reset =>reset,
						  Dout => reg_out5);
						  
						  Reg5_6 :	Reg5 port map ( Data => din,
						  enable => en(6),
						  Clk => Clk,
						  reset =>reset,
						  Dout => reg_out6);
						  
						  Reg5_7 :	Reg5 port map ( Data => din,
						  enable => en(7),
						  Clk => Clk,
						  reset =>reset,
						  Dout => reg_out7);
						  
						  Reg5_8 :	Reg5 port map ( Data => din,
						  enable => en(8),
						  Clk => Clk,
						  reset =>reset,
						  Dout => reg_out8);
						  
						  Reg5_9 :	Reg5 port map ( Data => din,
						  enable => en(9),
						  Clk => Clk,
						  reset =>reset,
						  Dout => reg_out9);
						  
						  Reg5_10 :	Reg5 port map ( Data => din,
						  enable => en(10),
						  Clk => Clk,
						  reset =>reset,
						  Dout => reg_out10);
						  
						  Reg5_11 :	Reg5 port map ( Data =>din,
						  enable => en(11),
						  Clk => Clk,
						  reset =>reset,
						  Dout => reg_out11);
						  
						  Reg5_12 :	Reg5 port map ( Data => din,
						  enable => en(12),
						  Clk => Clk,
						  reset =>reset,
						  Dout => reg_out12);
						  
						  Reg5_13 :	Reg5 port map ( Data => din,
						  enable => en(13),
						  Clk => Clk,
						  reset =>reset,
						  Dout => reg_out13);
						  
						  Reg5_14 :	Reg5 port map ( Data => din,
						  enable => en(14),
						  Clk => Clk,
						  reset =>reset,
						  Dout => reg_out14);
						  
						  Reg5_15 :	Reg5 port map ( Data => din,
						  enable => en(15),
						  Clk => Clk,
						  reset =>reset,
						  Dout => reg_out15);
						  
						  Reg5_16 :	Reg5 port map ( Data => din,
						  enable => en(16),
						  Clk => Clk,
						  reset =>reset,
						  Dout => reg_out16);
						  
						  Reg5_17 :Reg5 port map ( Data => din,
						  enable => en(17),
						  Clk => Clk,
						  reset =>reset,
						  Dout => reg_out17);
						  
						  Reg5_18 :	Reg5 port map ( Data => din,
						  enable => en(18),
						  Clk => Clk,
						  reset =>reset,
						  Dout => reg_out18);
						  
						  Reg5_19 :	Reg5 port map ( Data => din,
						  enable => en(19),
						  Clk => Clk,
						  reset =>reset,
						  Dout => reg_out19);
						  
						  Reg5_20 :	Reg5 port map ( Data => din,
						  enable => en(20),
						  Clk => Clk,
						  reset =>reset,
						  Dout => reg_out20);
						  
						  Reg5_21 :	Reg5 port map ( Data => din,
						  enable => en(21),
						  Clk => Clk,
						  reset =>reset,
						  Dout => reg_out21);
						  
						  Reg5_22 :	Reg5 port map ( Data => din,
						  enable => en(22),
						  Clk => Clk,
						  reset =>reset,
						  Dout => reg_out22);
						  
						  Reg5_23 :	Reg5 port map ( Data => din,
						  enable => en(23),
						  Clk => Clk,
						  reset =>reset,
						  Dout => reg_out23);
						  
						  Reg5_24 :	Reg5 port map ( Data => din,
						  enable => en(24),
						  Clk => Clk,
						  reset =>reset,
						  Dout => reg_out24);
						  
						  Reg5_25 :	Reg5 port map ( Data => din,
						  enable => en(25),
						  Clk => Clk,
						  reset =>reset,
						  Dout => reg_out25);
						  
						  Reg5_26 :	Reg5 port map ( Data => din,
						  enable => en(26),
						  Clk => Clk,
						  reset =>reset,
						  Dout => reg_out26);
						  
						  Reg5_27 :	Reg5 port map ( Data => din,
						  enable => en(27),
						  Clk => Clk,
						  reset =>reset,
						  Dout => reg_out27);
						  
						  Reg5_28 :	Reg5 port map ( Data => din,
						  enable => en(28),
						  Clk => Clk,
						  reset =>reset,
						  Dout => reg_out28);
						  
						  Reg5_29 :	Reg5 port map ( Data => din,
						  enable => en(29),
						  Clk => Clk,
						  reset =>reset,
						  Dout => reg_out29);
						  
						  Reg5_30 :	Reg5 port map ( Data => din,
						  enable => en(30),
						  Clk => Clk,
						  reset =>reset,
						  Dout => reg_out30);
						  
						  Reg5_31 :	Reg5 port map ( Data => din,
						  enable => en(31),
						  Clk => Clk,
						  reset =>reset,
						  Dout => reg_out31);
						  
						  Mux32_1 : Mux32_5 port map (
						Re0 => "00000",
						Re1 =>  reg_out1,
						Re2 =>  reg_out2,
						Re3 =>  reg_out3,
						Re4 =>  reg_out4,
						Re5 =>  reg_out5,
						Re6 =>  reg_out6,
						Re7 =>  reg_out7,
						Re8 =>  reg_out8,
						Re9 =>  reg_out9,
						Re10 => reg_out10,
						Re11 => reg_out11,
						Re12 => reg_out12,
						Re13 => reg_out13,
						Re14 => reg_out14,
						Re15 => reg_out15,
						Re16 => reg_out16,
						Re17 => reg_out17,
						Re18 => reg_out18,
						Re19 => reg_out19,
						Re20 => reg_out20,
						Re21 => reg_out21,
						Re22 => reg_out22,
						Re23 => reg_out23,
						Re24 => reg_out24,
						Re25 => reg_out25,
						Re26 => reg_out26,
						Re27 => reg_out27,
						Re28 => reg_out28,
						Re29 => reg_out29,
						Re30 => reg_out30,
						Re31 => reg_out31,
						SEL => Q,
						Dout => mux_out1);
						
Mux32_2 : Mux32_5 port map (
						Re0 => "00000",
						Re1 =>  reg_out1,
						Re2 =>  reg_out2,
						Re3 =>  reg_out3,
						Re4 =>  reg_out4,
						Re5 =>  reg_out5,
						Re6 =>  reg_out6,
						Re7 =>  reg_out7,
						Re8 =>  reg_out8,
						Re9 =>  reg_out9,
						Re10 => reg_out10,
						Re11 => reg_out11,
						Re12 => reg_out12,
						Re13 => reg_out13,
						Re14 => reg_out14,
						Re15 => reg_out15,
						Re16 => reg_out16,
						Re17 => reg_out17,
						Re18 => reg_out18,
						Re19 => reg_out19,
						Re20 => reg_out20,
						Re21 => reg_out21,
						Re22 => reg_out22,
						Re23 => reg_out23,
						Re24 => reg_out24,
						Re25 => reg_out25,
						Re26 => reg_out26,
						Re27 => reg_out27,
						Re28 => reg_out28,
						Re29 => reg_out29,
						Re30 => reg_out30,
						Re31 => reg_out31,
						SEL => Q2,
						Dout => mux_out2);
	
Compare_Module1 : Compare port map (
				InC2 => Q,
				InC1 => tag,
				OutC => Comp_Out1);
				
Compare_Module2 : Compare port map (
				InC2 => Q2,
				InC1 => tag,
				OutC => Comp_Out2);

Mux2_1 : Mux2_2 port map (
			  Sel => comp_out1,
           InM2 =>Din, 
           InM1 =>mux_out1,
           OutM =>End1);
			  
Mux2_22 : Mux2_2 port map (
			  Sel => comp_out2,
           InM2 =>Din,
           InM1 =>mux_out2,
           OutM =>End2);
			  
Qout <= End1;
Qout2 <= End2;

end Behavioral;

