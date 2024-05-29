# RISE task
scenario = "RISE retrieval task";
# uncomment the next line to enable the trigger
scenario_type = fMRI;
#scenario_type = fMRI_emulation;
scan_period = 2000;
#pcl_file = "RISE_ENCODING.pcl";

# header defaults

pulse_code = 10;
pulses_per_scan = 38;

default_background_color = 255, 255, 255;
default_text_color = 0, 0, 0;
default_text_align = align_center;
default_font_size = 24;
default_font = "Calibri";

response_matching = simple_matching;
active_buttons = 2;
button_codes = 1, 2;

default_trial_start_delay = 0;      # 0 sec between trials
default_stimulus_time_in = 0;       # stimulus starts with probe
default_trial_type = fixed;         # button press does not end trial
default_all_responses = true;       # log all responses


begin;
array{
bitmap{filename="ON_001.jpg"; description ="albero"; }albero1;
bitmap{filename="OIN289.jpg"; description ="tromba"; }tromba2;
bitmap{filename="sOIC089.jpg"; description ="sOIC089"; }sOIC089;
bitmap{filename="ON_015.jpg"; description ="corteccia"; }corteccia3;
bitmap{filename="FN_005.jpg"; description ="anguria01"; }anguria014;
bitmap{filename="OIC120.jpg"; description ="portauovo"; }portauovo5b;
bitmap{filename="OIN292.jpg"; description ="vascadabagno"; }vascadabagno6;
bitmap{filename="S__049.jpg"; description ="bagno"; }bagno7;
bitmap{filename="A__051.jpg"; description ="tartarugamarina"; }tartarugamarina8;
bitmap{filename="FN_085.jpg"; description ="pompelmi"; }pompelmi9;
bitmap{filename="ON_039.jpg"; description ="ninfea02"; }ninfea0210b;
bitmap{filename="OIN232.jpg"; description ="sassofono"; }sassofono11;
bitmap{filename="S__031.jpg"; description ="veliero"; }veliero12;
bitmap{filename="ON_039.jpg"; description ="ninfea02"; }ninfea0213;
bitmap{filename="ON_050.jpg"; description ="stellamarina"; }stellamarina14;
bitmap{filename="ON_040.jpg"; description ="orchidea"; }orchidea15;
bitmap{filename="sOIN183.jpg"; description ="sOIN183"; width = 477; height = 477; }sOIN183;
bitmap{filename="sOIN240.jpg"; description ="sOIN240"; width = 577; height = 577;}sOIN240;
bitmap{filename="OIC113.jpg"; description ="termometrodacarne"; }termometrodacarne16;
bitmap{filename="OIN146.jpg"; description ="libro"; }libro17;
bitmap{filename="ON_034.jpg"; description ="gomitolodilana"; }gomitolodilana18;
bitmap{filename="OIC095.jpg"; description ="spatola"; }spatola19;
bitmap{filename="OIC118.jpg"; description ="trinciapollo"; }trinciapollo20;
bitmap{filename="sOIC083.jpg"; description ="sOIC083"; width = 577; height = 577; }sOIC083;
bitmap{filename="sOIC099.jpg"; description ="sOIC099"; }sOIC099;
bitmap{filename="sFN_007.jpg"; description ="sFN_007"; width = 577; height = 577;}sFN_007;
bitmap{filename="S__041.jpg"; description ="villaggioturistico"; }villaggioturistico21;
bitmap{filename="sFN_048.jpg"; description ="sFN_048"; }sFN_048;
bitmap{filename="OIC112.jpg"; description ="teiera"; }teiera22;
bitmap{filename="ON_008.jpg"; description ="cespuglio02"; }cespuglio0223;
bitmap{filename="sOIN016.jpg"; description ="sOIN016"; }sOIN016;
bitmap{filename="ON_009.jpg"; description ="conchiglia"; }conchiglia24;
bitmap{filename="OIN033.jpg"; description ="palladabowling"; }palladabowling25;
bitmap{filename="sOIC082.jpg"; description ="sOIC082"; }sOIC082;
bitmap{filename="OIC115.jpg"; description ="tostapane"; }tostapane26;
bitmap{filename="A__014.jpg"; description ="colibrì"; }colibri27;
bitmap{filename="ON_040.jpg"; description ="orchidea"; }orchidea28;
bitmap{filename="ON_015.jpg"; description ="corteccia"; }corteccia29;
bitmap{filename="OIC118.jpg"; description ="trinciapollo"; }trinciapollo30;
bitmap{filename="OIN156.jpg"; description ="materasso"; }materasso31;
bitmap{filename="sOIC011.jpg"; description ="sOIC011"; }sOIC011;
bitmap{filename="sFN_053.jpg"; description ="sFN_053"; }sFN_053;
bitmap{filename="sFI_054.jpg"; description ="sFI_054"; }sFI_054;
bitmap{filename="sFN_031.jpg"; description ="sFN_031"; width = 477; height = 477; }sFN_031;
bitmap{filename="OIN279.jpg"; description ="telescopio"; }telescopio32;
bitmap{filename="sOIN154.jpg"; description ="sOIN154"; }sOIN154;
bitmap{filename="sOIN076.jpg"; description ="sOIN076"; }sOIN076;
bitmap{filename="S__011.jpg"; description ="piscina"; }piscina33;
bitmap{filename="sOIC118.jpg"; description ="sOIC118"; }sOIC118;
bitmap{filename="ON_046.jpg"; description ="radici"; }radici34;
bitmap{filename="sFN_052.jpg"; description ="sFN_052"; width = 577; height = 577; }sFN_052;
bitmap{filename="OIN197.jpg"; description ="pianoforte"; }pianoforte35;
bitmap{filename="sOIN247.jpg"; description ="sOIN247"; width = 477; height = 477;}sOIN247;
bitmap{filename="FN_064.jpg"; description ="pescanoce01"; }pescanoce0136;
bitmap{filename="OIC122.jpg"; description ="vassoio"; }vassoio37;
bitmap{filename="A__006.jpg"; description ="pastoretedesco"; }pastoretedesco38;
bitmap{filename="A__007.jpg"; description ="cavallo"; }cavallo39;
bitmap{filename="S__031.jpg"; description ="veliero"; }veliero40;
bitmap{filename="ON_050.jpg"; description ="stellamarina"; }stellamarina41;
bitmap{filename="OIC121.jpg"; description ="vaschettadaghiaccio"; }vaschettadaghiaccio42;
bitmap{filename="A__038.jpg"; description ="pavone"; }pavone43;
bitmap{filename="sOIC066.jpg"; description ="sOIC066"; }sOIC066;
bitmap{filename="OIN096.jpg"; description ="banconota02"; }banconota0244;
bitmap{filename="A__038.jpg"; description ="pavone"; }pavone45;
bitmap{filename="OIN146.jpg"; description ="libro"; }libro46;
bitmap{filename="FN_056.jpg"; description ="mela02"; }mela0247;
bitmap{filename="sOIN140.jpg"; description ="sOIN140"; width = 477; height = 477; }sOIN140;
bitmap{filename="S__017.jpg"; description ="paesino"; }paesino48;
bitmap{filename="A__035.jpg"; description ="orsopolare"; }orsopolare49;
bitmap{filename="sOIN297.jpg"; description ="sOIN297"; }sOIN297;
bitmap{filename="OIC122.jpg"; description ="vassoio"; }vassoio50;
bitmap{filename="sOIN119.jpg"; description ="sOIN119"; width = 577; height = 577;}sOIN119;
bitmap{filename="ON_020.jpg"; description ="erba"; }erba51;
bitmap{filename="OIC123.jpg"; description ="zuccheriera"; }zuccheriera52;
bitmap{filename="OIC121.jpg"; description ="vaschettadaghiaccio"; }vaschettadaghiaccio53;
bitmap{filename="FN_004.jpg"; description ="ananas"; }ananas54;
bitmap{filename="sOIN294.jpg"; description ="sOIN294"; }sOIN294;
bitmap{filename="OIN051.jpg"; description ="cartedagioco"; }cartedagioco55;
bitmap{filename="OIC119.jpg"; description ="tritacarne"; }tritacarne56;
bitmap{filename="sOIN031.jpg"; description ="sOIN031"; }sOIN031;
bitmap{filename="sOIN206.jpg"; description ="sOIN206"; }sOIN206;
bitmap{filename="OIN004.jpg"; description ="altoparlanti"; }altoparlanti57;
bitmap{filename="S__017.jpg"; description ="paesino"; }paesino58;
bitmap{filename="OIN200.jpg"; description ="girandola"; }girandola59;
bitmap{filename="A__035.jpg"; description ="orsopolare"; }orsopolare60;
bitmap{filename="sOIN221.jpg"; description ="sOIN221"; }sOIN221;
bitmap{filename="sFI_053.jpg"; description ="sFI_053"; width = 477; height = 477;}sFI_053;
bitmap{filename="sFN_055.jpg"; description ="sFN_055"; }sFN_055;
bitmap{filename="sOIN153.jpg"; description ="sOIN153"; }sOIN153;
bitmap{filename="S__011.jpg"; description ="piscina"; }piscina61;
bitmap{filename="ON_046.jpg"; description ="radici"; }radici62;
bitmap{filename="OIC119.jpg"; description ="tritacarne"; }tritacarne63;
bitmap{filename="OIC104.jpg"; description ="tappodisughero"; }tappodisughero64;
bitmap{filename="OIN070.jpg"; description ="chitarra"; }chitarra65;
bitmap{filename="OIC117.jpg"; description ="tovagliolo02"; }tovagliolo0266;
bitmap{filename="OIN289.jpg"; description ="tromba"; }tromba67;
bitmap{filename="sOIN118.jpg"; description ="sOIN118"; }sOIN118;
bitmap{filename="OIN258.jpg"; description ="spazzolinodadenti"; }spazzolinodadenti69;
bitmap{filename="ON_008.jpg"; description ="cespuglio02"; }cespuglio0270;
bitmap{filename="ON_009.jpg"; description ="conchiglia"; }conchiglia80;
	} array_img_left_retrieval;

array{
bitmap{filename="OIN070.jpg"; description ="chitarra"; }chitarra1;
bitmap{filename="FN_038.jpg"; description ="fragole"; }fragole2;
bitmap{filename="sOIN291.jpg"; description ="sOIN291"; }sOIN291;
bitmap{filename="OIN004.jpg"; description ="altoparlanti"; }altoparlanti4;
bitmap{filename="OIC120.jpg"; description ="portauovo"; }portauovo5;
bitmap{filename="FN_060.jpg"; description ="melone"; }melone6;
bitmap{filename="A__006.jpg"; description ="pastoretedesco"; }pastoretedesco7;
bitmap{filename="ON_001.jpg"; description ="albero"; }albero8;
bitmap{filename="OIN033.jpg"; description ="palladabowling"; }palladabowling9;
bitmap{filename="OIC113.jpg"; description ="termometrodacarne"; }termometrodacarne10;
bitmap{filename="OIC104.jpg"; description ="tappodisughero"; }tappodisughero11;
bitmap{filename="OIC097.jpg"; description ="spremiagrumi"; }spremiagrumi12;
bitmap{filename="S__039.jpg"; description ="villa"; }villa13;
bitmap{filename="OIN076.jpg"; description ="computer"; }computer14;
bitmap{filename="OIC111.jpg"; description ="teglia"; }teglia15;
bitmap{filename="OIN085.jpg"; description ="culla"; }culla16;
bitmap{filename="sOIN035.jpg"; description ="sOIN035"; width = 577; height = 577;}sOIN035;
bitmap{filename="sOIN160.jpg"; description ="sOIN160"; width = 477; height = 477; }sOIN160;
bitmap{filename="OIN096.jpg"; description ="banconota02"; }banconota17;
bitmap{filename="OIN092.jpg"; description ="casco"; }casco18;
bitmap{filename="OIC111.jpg"; description ="teglia"; }teglia19;
bitmap{filename="OIN051.jpg"; description ="cartedagioco"; }cartedagioco20;
bitmap{filename="S__041.jpg"; description ="villaggioturistico"; }villaggioturistico21b;
bitmap{filename="sOIN256.jpg"; description ="sOIN256"; width = 477; height = 477; }sOIN256;
bitmap{filename="sOIN058.jpg"; description ="sOIN058"; }sOIN058;
bitmap{filename="sOIC100.jpg"; description ="sOIC100"; width = 477; height = 477; }sOIC100;
bitmap{filename="OIC117.jpg"; description ="tovagliolo02"; }tovagliolo022;
bitmap{filename="sOIN216.jpg"; description ="sOIN216"; }sOIN216;
bitmap{filename="OIN197.jpg"; description ="pianoforte"; }pianoforte23;
bitmap{filename="S__056.jpg"; description ="spiaggia"; }spiaggia24;
bitmap{filename="sOIN022.jpg"; description ="sOIN022"; }sOIN022;
bitmap{filename="OIC112.jpg"; description ="teiera"; }teiera25;
bitmap{filename="ON_020.jpg"; description ="erba"; }erba26;
bitmap{filename="sOIN158.jpg"; description ="sOIN158"; }sOIN158;
bitmap{filename="FN_085.jpg"; description ="pompelmi"; }pompelmi27b;
bitmap{filename="OIN258.jpg"; description ="spazzolinodadenti"; }spazzolinodadenti28;
bitmap{filename="OIC102.jpg"; description ="tagliere"; }tagliere29;
bitmap{filename="A__019.jpg"; description ="gatto"; }gatto30;
bitmap{filename="FN_043.jpg"; description ="macedonia"; }macedonia31;
bitmap{filename="S__042.jpg"; description ="cascate"; }cascate32;
bitmap{filename="sOIN128.jpg"; description ="sOIN128"; }sOIN128;
bitmap{filename="sOIC079.jpg"; description ="sOIC079"; }sOIC079;
bitmap{filename="sOIN081.jpg"; description ="sOIN081"; }sOIN081;
bitmap{filename="sOIC111.jpg"; description ="sOIC111"; width = 577; height = 577;}sOIC111;
bitmap{filename="A__019.jpg"; description ="gatto"; }gatto33;
bitmap{filename="sOIC003.jpg"; description ="sOIC003"; }sOIC003;
bitmap{filename="sOIN060.jpg"; description ="sOIN060"; }sOIN060;
bitmap{filename="OIN076.jpg"; description ="computer"; }computer34;
bitmap{filename="sFI_063.jpg"; description ="sFI_063"; }sFI_063;
bitmap{filename="OIC095.jpg"; description ="spatola"; }spatola35;
bitmap{filename="sOIN092.jpg"; description ="sOIN092"; width = 477; height = 477;}sOIN092;
bitmap{filename="FN_004.jpg"; description ="ananas"; }ananas36;
bitmap{filename="sOIC116.jpg"; description ="sOIC116"; width = 577; height = 577; }sOIC116;
bitmap{filename="OIN200.jpg"; description ="girandola"; }girandola37;
bitmap{filename="OIC109.jpg"; description ="tazzina03"; }tazzina0338;
bitmap{filename="A__051.jpg"; description ="tartarugamarina"; }tartarugamarina39;
bitmap{filename="OIN156.jpg"; description ="materasso"; }materasso40;
bitmap{filename="FN_005.jpg"; description ="anguria01"; }anguria0141;
bitmap{filename="S__039.jpg"; description ="villa"; }villa42;
bitmap{filename="FN_043.jpg"; description ="macedonia"; }macedonia43;
bitmap{filename="OIN092.jpg"; description ="casco"; }casco44;
bitmap{filename="sOIN018.jpg"; description ="sOIN018"; }sOIN018;
bitmap{filename="OIC115.jpg"; description ="tostapane"; }tostapane45;
bitmap{filename="OIC097.jpg"; description ="spremiagrumi"; }spremiagrumi46;
bitmap{filename="S__049.jpg"; description ="bagno"; }bagno47;
bitmap{filename="ON_034.jpg"; description ="gomitolodilana"; }gomitolodilana48;
bitmap{filename="sFN_091.jpg"; description ="sFN_091"; width = 577; height = 577; }sFN_091;
bitmap{filename="FN_038.jpg"; description ="fragole"; }fragole49;
bitmap{filename="OIN089.jpg"; description ="divano"; }divano50;
bitmap{filename="sOIN198.jpg"; description ="sOIN198"; }sOIN198;
bitmap{filename="A__020.jpg"; description ="giraffa"; }giraffa51;
bitmap{filename="sOIN041.jpg"; description ="sOIN041"; width = 477; height = 477; }sOIN041;
bitmap{filename="OIN089.jpg"; description ="divano"; }divano52;
bitmap{filename="A__014.jpg"; description ="colibrì"; }colibri53;
bitmap{filename="A__020.jpg"; description ="giraffa"; }giraffa54;
bitmap{filename="OIN292.jpg"; description ="vascadabagno"; }vascadabagno55;
bitmap{filename="sOIN264.jpg"; description ="sOIN264"; }sOIN264;
bitmap{filename="A__007.jpg"; description ="cavallo"; }cavallo56;
bitmap{filename="OIN085.jpg"; description ="culla"; }culla57;
bitmap{filename="sOIN284.jpg"; description ="sOIN284"; }sOIN284;
bitmap{filename="sOIN142.jpg"; description ="sOIN142"; }sOIN142;
bitmap{filename="OIN279.jpg"; description ="telescopio"; }telescopio58;
bitmap{filename="OIC102.jpg"; description ="tagliere"; }tagliere59;
bitmap{filename="FN_028.jpg"; description ="ciliegie"; }ciliegie60;
bitmap{filename="OIC109.jpg"; description ="tazzina03"; }tazzina0361;
bitmap{filename="sOIN048.jpg"; description ="sOIN048"; }sOIN048;
bitmap{filename="sOIN014.jpg"; description ="sOIN014"; width = 577; height = 577; }sOIN014;
bitmap{filename="sOIC119.jpg"; description ="sOIC119"; }sOIC119;
bitmap{filename="sOIN110.jpg"; description ="sOIN110"; }sOIN110;
bitmap{filename="FN_060.jpg"; description ="melone"; }melone62;
bitmap{filename="OIC098.jpg"; description ="stampino"; }stampino63;
bitmap{filename="FN_056.jpg"; description ="mela02"; }mela0264;
bitmap{filename="OIC123.jpg"; description ="zuccheriera"; }zuccheriera65;
bitmap{filename="OIN232.jpg"; description ="sassofono"; }sassofono66;
bitmap{filename="S__056.jpg"; description ="spiaggia"; }spiaggia67;
bitmap{filename="S__042.jpg"; description ="cascate"; }cascate68;
bitmap{filename="sOIC027.jpg"; description ="sOIC027"; }sOIC027;
bitmap{filename="FN_064.jpg"; description ="pescanoce01"; }pescanoce0169;
bitmap{filename="OIC098.jpg"; description ="stampino"; }stampino70;
bitmap{filename="FN_028.jpg"; description ="ciliegie"; }ciliegie80;
	} array_img_right_retrieval;


#dummy scan occupato con trial di istruzioni

trial{
trial_type=fixed;
	picture{ 
	bitmap {filename = "instr_RISE_RET.jpg"; description = "instructions"; }bmp_instr_r;
	x= 0; y= 0;
	 }pic_instr_retrieval;
duration = 10000; 
response_active=false;
mri_pulse=1;
}trial_instr_retrieval;

#trial_xhair
trial{
trial_type=fixed;
   stimulus_event {#creato stimulus event
	   picture{ 
	     bitmap {filename = "crosshair.jpg"; description = "xhair"; }bmp_xhair;
	     x= 0; y= 0;
	 }pic_xhair;
#duration = 2500;
response_active=false;
  }stimulus_xhair;
}trial_xhair;

#trial_null_event
trial{
trial_type=fixed;
   stimulus_event {#creato stimulus event
	   picture{ 
	     bitmap {filename = "crosshair.jpg"; description = "null_event"; }bmp_ne;
	     x= 0; y= 0;
	 }pic_ne;
duration = 2000;
response_active=false;
  }stimulus_ne;
}trial_ne;

#main trial retrieval
trial{
trial_type=fixed;
	stimulus_event {
		picture{
			#bitmap pavone;
			#x = 400; y=0;
			#bitmap casco;
			#x = -400; y=0;
			bitmap {filename = ""; preload = false;} bmp_left_retrieval;
			x= 410; y= 0; 
			bitmap {filename = ""; preload = false;} bmp_right_retrieval;
			x =-410; y=0;
			} main_pic_retrieval;
		#picture{
			#bitmap casco;
			#x = 400; y=0;
			#} main_pic_right;
duration = 2000; #mod durata da 3000 a 2000
response_active=true;
stimulus_time_in=0;
stimulus_time_out=2000;
		}main_event_retrieval; 
	}main_trial_retrieval;

####info necessarie

begin_pcl;
#preset string subject;
#preset string date;
#logfile.set_filename(subject + date + "_RISE.xls");
#retrieval
int max_tr_r = 100;
array <string> code_r[max_tr_r] = {"stimulus","stimulus","crosshair","stimulus","stimulus","stimulus","stimulus","stimulus","stimulus","stimulus","stimulus","stimulus","stimulus","stimulus","stimulus","stimulus","scrambled","scrambled","stimulus","stimulus","stimulus","stimulus","stimulus","scrambled","scrambled","scrambled","stimulus","crosshair","stimulus","stimulus","scrambled","stimulus","stimulus","scrambled","stimulus","stimulus","stimulus","stimulus","stimulus","stimulus","crosshair","crosshair","scrambled","scrambled","stimulus","crosshair","scrambled","stimulus","crosshair","stimulus","scrambled","stimulus","scrambled","stimulus","stimulus","stimulus","stimulus","stimulus","stimulus","stimulus","stimulus","scrambled","stimulus","stimulus","stimulus","stimulus","scrambled","stimulus","stimulus","scrambled","stimulus","scrambled","stimulus","stimulus","stimulus","stimulus","crosshair","stimulus","stimulus","crosshair","crosshair","stimulus","stimulus","stimulus","stimulus","scrambled","scrambled","scrambled","scrambled","stimulus","stimulus","stimulus","stimulus","stimulus","stimulus","stimulus","crosshair","stimulus","stimulus","stimulus"}; 
array <int> target_button_r[max_tr_r] = {1,1,0,1,2,1,1,2,1,2,1,1,2,2,2,1,1,1,1,2,1,2,1,1,2,1,2,0,2,2,2,1,2,2,1,2,2,2,2,1,0,0,2,1,1,0,2,1,0,1,1,1,1,2,2,2,2,1,1,1,1,2,2,2,1,2,1,2,2,2,1,1,1,1,2,2,0,1,2,0,0,2,1,1,1,2,1,2,2,2,2,1,2,2,1,2,0,1,1,2};
array <int> duration_xhair_r[max_tr_r] = {2000,2500,2250,1500,1750,2000,1750,1500,2000,2250,1500,2500,2500,2000,2500,2000,2250,1500,2000,2000,1750,1750,1500,1500,2000,1750,2250,1750,2500,2500,1500,2250,1750,2500,1750,2250,2250,1750,2000,2250,2000,2250,2500,2500,2250,2250,1750,1500,2000,1750,2500,2500,2250,2250,1750,1750,1500,1500,2500,1750,2000,2500,1500,2000,1500,2500,1750,1500,2500,1750,2250,2500,1500,2000,1500,1500,1500,2250,1500,2000,2250,1500,2500,1750,2000,1750,1500,2500,2000,2250,2500,2500,2000,2250,2250,2000,2000,2250,1750,1750};

###ESPERIMENTO###
trial_instr_retrieval.present();

loop   int i = 1;
until   i > max_tr_r
begin
   if (code_r[i] == "crosshair") then
      stimulus_ne.set_stimulus(pic_ne);
      stimulus_ne.set_target_button(0); # not a target
      trial_ne.present();
   elseif (code_r[i] == "stimulus") then 
	   array_img_left_retrieval[i].load();
      main_pic_retrieval.set_part(1, array_img_left_retrieval[i]);
      array_img_right_retrieval[i].load();
      main_pic_retrieval.set_part(2, array_img_right_retrieval[i]);
      main_event_retrieval.set_stimulus(main_pic_retrieval);
      main_event_retrieval.set_target_button(target_button_r[i]);
      main_trial_retrieval.present();
   elseif (code_r[i] == "scrambled") then 
	   array_img_left_retrieval[i].load();
      main_pic_retrieval.set_part(1, array_img_left_retrieval[i]);
      array_img_right_retrieval[i].load();
      main_pic_retrieval.set_part(2, array_img_right_retrieval[i]);
      main_event_retrieval.set_stimulus(main_pic_retrieval);
      main_event_retrieval.set_target_button(target_button_r[i]);
      main_trial_retrieval.present();
end;
stimulus_xhair.set_duration(duration_xhair_r[i]);
trial_xhair.present();
i = i + 1;
end;
