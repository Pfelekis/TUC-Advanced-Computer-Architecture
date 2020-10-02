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
           tag : in  STD_LOGIC_VECTOR (4 downto 0);
           Q : in  STD_LOGIC_VECTOR (4 downto 0);
           Qout : out  STD_LOGIC_VECTOR (4 downto 0);
			  Q2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Qout2 : out  STD_LOGIC_VECTOR (4 downto 0));
end RegisterResultStatus;

architecture Behavioral of RegisterResultStatus is

component Reg5 is
		Port ( Data : in  STD_LOGIC_VECTOR (4 downto 0);
             CLK : in  STD_LOGIC;
             Dout : out  STD_LOGIC_VECTOR (4 downto 0);
             Enable : in  STD_LOGIC);
end component;

component Decoder is
    Port ( InD : in  STD_LOGIC_VECTOR (4 downto 0);
           OutD : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal reg_out1,reg_out2,reg_out3,reg_out4,reg_out5,reg_out6,reg_out7,reg_out8,reg_out9,reg_out10,reg_out11,reg_out12,reg_out13,reg_out14,reg_out15,reg_out16,reg_out17,reg_out18,reg_out19,reg_out20,reg_out21,reg_out22,reg_out23,reg_out24,reg_out25,reg_out26,reg_out27,reg_out28,reg_out29,reg_out30,reg_out31 : std_logic_vector (4 downto 0);
signal en : std_logic_vector (31 downto 0);
begin


						  Dec : Decoder port map ( InD => tag,
						  OutD => en);


						  Reg5_0 : Reg5 port map ( Data =>q,
						  enable => en(0),
						  Clk => Clk,
						  Dout => Qout);
						  
						  Reg5_1 :	Reg5 port map ( Data => q,
						  enable=> en(1),
						  Clk => Clk,
						  Dout => Qout);
						  
						  Reg5_2 :	Reg5 port map ( Data => q,
						  enable => en(2),
						  Clk => Clk,
						  Dout => Qout);
						  
						  Reg5_3 :	Reg5 port map ( Data => q,
						  enable => en(3),
						  Clk => Clk,
						  Dout => reg_out3);
						  
						  Reg5_4 :	Reg5 port map ( Data => q,
						  enable => en(4),
						  Clk => Clk,
						  Dout => reg_out4);
						  
						  Reg5_5 :	Reg5 port map ( Data => q,
						  enable => en(5),
						  Clk => Clk,
						  Dout => reg_out5);
						  
						  Reg5_6 :	Reg5 port map ( Data => q,
						  enable => en(6),
						  Clk => Clk,
						  Dout => reg_out6);
						  
						  Reg5_7 :	Reg5 port map ( Data => q,
						  enable => en(7),
						  Clk => Clk,
						  Dout => reg_out7);
						  
						  Reg5_8 :	Reg5 port map ( Data => q,
						  enable => en(8),
						  Clk => Clk,
						  Dout => reg_out8);
						  
						  Reg5_9 :	Reg5 port map ( Data => q,
						  enable => en(9),
						  Clk => Clk,
						  Dout => reg_out9);
						  
						  Reg5_10 :	Reg5 port map ( Data => q,
						  enable => en(10),
						  Clk => Clk,
						  Dout => reg_out10);
						  
						  Reg5_11 :	Reg5 port map ( Data =>q,
						  enable => en(11),
						  Clk => Clk,
						  Dout => reg_out11);
						  
						  Reg5_12 :	Reg5 port map ( Data => q,
						  enable => en(12),
						  Clk => Clk,
						  Dout => reg_out12);
						  
						  Reg5_13 :	Reg5 port map ( Data => q,
						  enable => en(13),
						  Clk => Clk,
						  Dout => reg_out13);
						  
						  Reg5_14 :	Reg5 port map ( Data => q,
						  enable => en(14),
						  Clk => Clk,
						  Dout => reg_out14);
						  
						  Reg5_15 :	Reg5 port map ( Data => q,
						  enable => en(15),
						  Clk => Clk,
						  Dout => reg_out15);
						  
						  Reg5_16 :	Reg5 port map ( Data => q,
						  enable => en(16),
						  Clk => Clk,
						  Dout => reg_out16);
						  
						  Reg5_17 :Reg5 port map ( Data => q,
						  enable => en(17),
						  Clk => Clk,
						  Dout => reg_out17);
						  
						  Reg5_18 :	Reg5 port map ( Data => q,
						  enable => en(18),
						  Clk => Clk,
						  Dout => reg_out18);
						  
						  Reg5_19 :	Reg5 port map ( Data => q,
						  enable => en(19),
						  Clk => Clk,
						  Dout => reg_out19);
						  
						  Reg5_20 :	Reg5 port map ( Data => q,
						  enable => en(20),
						  Clk => Clk,
						  Dout => reg_out20);
						  
						  Reg5_21 :	Reg5 port map ( Data => q,
						  enable => en(21),
						  Clk => Clk,
						  Dout => reg_out21);
						  
						  Reg5_22 :	Reg5 port map ( Data => q,
						  enable => en(22),
						  Clk => Clk,
						  Dout => reg_out22);
						  
						  Reg5_23 :	Reg5 port map ( Data => q,
						  enable => en(23),
						  Clk => Clk,
						  Dout => reg_out23);
						  
						  Reg5_24 :	Reg5 port map ( Data => q,
						  enable => en(24),
						  Clk => Clk,
						  Dout => reg_out24);
						  
						  Reg5_25 :	Reg5 port map ( Data => q,
						  enable => en(25),
						  Clk => Clk,
						  Dout => reg_out25);
						  
						  Reg5_26 :	Reg5 port map ( Data => q,
						  enable => en(26),
						  Clk => Clk,
						  Dout => reg_out26);
						  
						  Reg5_27 :	Reg5 port map ( Data => q,
						  enable => en(27),
						  Clk => Clk,
						  Dout => reg_out27);
						  
						  Reg5_28 :	Reg5 port map ( Data => q,
						  enable => en(28),
						  Clk => Clk,
						  Dout => reg_out28);
						  
						  Reg5_29 :	Reg5 port map ( Data => q,
						  enable => en(29),
						  Clk => Clk,
						  Dout => reg_out29);
						  
						  Reg5_30 :	Reg5 port map ( Data => q,
						  enable => en(30),
						  Clk => Clk,
						  Dout => reg_out30);
						  
						  Reg5_31 :	Reg5 port map ( Data => q,
						  enable => en(31),
						  Clk => Clk,
						  Dout => reg_out31);

end Behavioral;

