# RISE task
scenario = "RISE encoding task";
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
#create array of two answer options
array{
bitmap{filename="A__038.jpg"; description ="pavone"; }pavone1;
bitmap{filename="sFI_049.jpg"; description ="sFI_049";  width = 577; height = 577; }sFI_049;
bitmap{filename="sOIN255.jpg"; description ="sOIN255";  width = 477; height = 477; }sOIN255;
bitmap{filename="OIN146.jpg"; description ="libro"; }libro2;
bitmap{filename="sOIC016.jpg"; description ="sOIC016"; }sOIC016;
bitmap{filename="sOIN268.jpg"; description ="sOIN268"; }sOIN268;
bitmap{filename="sFN_002.jpg"; description ="sFN_002"; }sFN_002;
bitmap{filename="OIN232.jpg"; description ="sassofono"; }sassofono3;
bitmap{filename="ON_050.jpg"; description ="stellamarina"; }stellamarina4;
bitmap{filename="OIC118.jpg"; description ="trinciapollo"; }trinciapollo5;
bitmap{filename="sOIN029.jpg"; description ="sOIN029"; }sOIN029;
bitmap{filename="OIC117.jpg"; description ="tovagliolo02"; }tovagliolo026;
bitmap{filename="S__011.jpg"; description ="piscina"; }piscina7;
bitmap{filename="ON_009.jpg"; description ="conchiglia"; }conchiglia8;
bitmap{filename="sOIN254.jpg"; description ="sOIN254"; }sOIN254;
bitmap{filename="OIC122.jpg"; description ="vassoio"; }vassoio9;
bitmap{filename="ON_039.jpg"; description ="ninfea02"; }ninfea0210;
bitmap{filename="sOIN129.jpg"; description ="sOIN129"; }sOIN129;
bitmap{filename="sOIN070.jpg"; description ="sOIN070";  width = 477; height = 477; }sOIN070;
bitmap{filename="OIC113.jpg"; description ="termometrodacarne"; }termometrodacarne11;
bitmap{filename="sOIN165.jpg"; description ="sOIN165"; }sOIN165;
bitmap{filename="S__017.jpg"; description ="paesino"; }paesino12;
bitmap{filename="ON_020.jpg"; description ="erba"; }erba13;
bitmap{filename="OIN279.jpg"; description ="telescopio"; }telescopio14;
bitmap{filename="OIN156.jpg"; description ="materasso"; }materasso15;
bitmap{filename="ON_001.jpg"; description ="albero"; }albero16;
bitmap{filename="sOIN126.jpg"; description ="sOIN126"; }sOIN126;
bitmap{filename="sOIN085.jpg"; description ="sOIN085"; }sOIN085;
bitmap{filename="OIN051.jpg"; description ="cartedagioco"; }cartedagioco17;
bitmap{filename="sFN_042.jpg"; description ="sFN_042"; }sFN_042;
bitmap{filename="A__035.jpg"; description ="orsopolare"; }orsopolare18;
bitmap{filename="OIN200.jpg"; description ="girandola"; }girandola19;
bitmap{filename="OIN289.jpg"; description ="tromba"; }tromba20;
bitmap{filename="sOIN196.jpg"; description ="sOIN196"; }sOIN196;
bitmap{filename="sOIN105.jpg"; description ="sOIN105";  width = 577; height = 577;}sOIN105;
bitmap{filename="S__031.jpg"; description ="veliero"; }veliero21;
bitmap{filename="OIN197.jpg"; description ="pianoforte"; }pianoforte22;
bitmap{filename="OIC123.jpg"; description ="zuccheriera"; }zuccheriera23;
bitmap{filename="ON_008.jpg"; description ="cespuglio02"; }cespuglio0224;
bitmap{filename="OIC120.jpg"; description ="portauovo"; }portauovo25;
bitmap{filename="OIN292.jpg"; description ="vascadabagno"; }vascadabagno26;
bitmap{filename="sOIN283.jpg"; description ="sOIN283"; }sOIN283;
bitmap{filename="OIC115.jpg"; description ="tostapane"; }tostapane27;
bitmap{filename="OIC121.jpg"; description ="vaschettadaghiaccio"; }vaschettadaghiaccio28;
bitmap{filename="OIC119.jpg"; description ="tritacarne"; }tritacarne29;
bitmap{filename="sFI_024.jpg"; description ="sFI_024"; }sFI_024;
bitmap{filename="sOIC081.jpg"; description ="sOIC081"; }sOIC081;
bitmap{filename="ON_046.jpg"; description ="radici"; }radici30;
bitmap{filename="ON_040.jpg"; description ="orchidea"; }orchidea31;
bitmap{filename="OIN258.jpg"; description ="spazzolinodadenti"; }spazzolinodadenti32;
bitmap{filename="ON_015.jpg"; description ="corteccia"; }corteccia33;
bitmap{filename="sOIN286.jpg"; description ="sOIN286"; }sOIN286;
bitmap{filename="ON_034.jpg"; description ="gomitolodilana"; }gomitolodilana34;
bitmap{filename="sFN_019.jpg"; description ="sFN_019";  width = 577; height = 577; }sFN_019;
bitmap{filename="A__051.jpg"; description ="tartarugamarina"; }tartarugamarina35;
	} array_img_left_encoding;

array{
bitmap{filename="OIN092.jpg"; description ="casco"; }casco1;
bitmap{filename="sFN_086.jpg"; description ="sFN_086"; width = 477; height = 477; }sFN_086;
bitmap{filename="sOIC104.jpg"; description ="sOIC104";  width = 577; height = 577; }sOIC104;
bitmap{filename="S__049.jpg"; description ="bagno"; }bagno2;
bitmap{filename="sFI_048.jpg"; description ="sFI_048"; }sFI_048;
bitmap{filename="sFN_088.jpg"; description ="sFN_088";  }sFN_088;
bitmap{filename="sOIN163.jpg"; description ="sOIN163"; }sOIN163;
bitmap{filename="OIC097.jpg"; description ="spremiagrumi"; }spremiagrumi3;
bitmap{filename="S__039.jpg"; description ="villa"; }villa4;
bitmap{filename="S__041.jpg"; description ="villaggioturistico"; }villaggioturistico5;
bitmap{filename="sOIC034.jpg"; description ="sOIC034"; }sOIC034;
bitmap{filename="S__056.jpg"; description ="spiaggia"; }spiaggia6;
bitmap{filename="OIN076.jpg"; description ="computer"; }computer7;
bitmap{filename="OIC112.jpg"; description ="teiera"; }teiera8;
bitmap{filename="sOIN084.jpg"; description ="sOIN084"; }sOIN084;
bitmap{filename="A__020.jpg"; description ="giraffa"; }giraffa9;
bitmap{filename="OIC104.jpg"; description ="tappodisughero"; }tappodisughero10;
bitmap{filename="sFN_032.jpg"; description ="sFN_032"; }sFN_032;
bitmap{filename="sOIN021.jpg"; description ="sOIN021";  width = 577; height = 577; }sOIN021;
bitmap{filename="OIN096.jpg"; description ="banconota02"; }banconota0211;
bitmap{filename="sOIN211.jpg"; description ="sOIN211"; }sOIN211;
bitmap{filename="OIC102.jpg"; description ="tagliere"; }tagliere12;
bitmap{filename="OIN089.jpg"; description ="divano"; }divano13;
bitmap{filename="A__019.jpg"; description ="gatto"; }gatto14;
bitmap{filename="S__042.jpg"; description ="cascate"; }cascate15;
bitmap{filename="OIN070.jpg"; description ="chitarra"; }chitarra16;
bitmap{filename="sFN_041.jpg"; description ="sFN_041"; }sFN_041;
bitmap{filename="sFI_017.jpg"; description ="sFI_017"; }sFI_017;
bitmap{filename="A__007.jpg"; description ="cavallo"; }cavallo17;
bitmap{filename="sOIN019.jpg"; description ="sOIN019"; }sOIN019;
bitmap{filename="OIC109.jpg"; description ="tazzina03"; }tazzina0318;
bitmap{filename="FN_028.jpg"; description ="ciliegie"; }ciliegie19;
bitmap{filename="FN_038.jpg"; description ="fragole"; }fragole20;
bitmap{filename="sFI_026.jpg"; description ="sFI_026"; }sFI_026;
bitmap{filename="sOIC113.jpg"; description ="sOIC113";  width = 477; height = 477;}sOIC113;
bitmap{filename="FN_005.jpg"; description ="anguria01"; }anguria0121;
bitmap{filename="FN_004.jpg"; description ="ananas"; }ananas22;
bitmap{filename="A__014.jpg"; description ="colibrì"; }colibri23;
bitmap{filename="OIC098.jpg"; description ="stampino"; }stampino24;
bitmap{filename="FN_060.jpg"; description ="melone"; }melone25;
bitmap{filename="A__006.jpg"; description ="pastoretedesco"; }pastoretedesco26;
bitmap{filename="sOIN207.jpg"; description ="sOIN207"; }sOIN207;
bitmap{filename="FN_085.jpg"; description ="pompelmi"; }pompelmi27;
bitmap{filename="FN_043.jpg"; description ="macedonia"; }macedonia28;
bitmap{filename="FN_056.jpg"; description ="mela02"; }mela0229;
bitmap{filename="sOIN133.jpg"; description ="sOIN133"; }sOIN133;
bitmap{filename="sOIC069.jpg"; description ="sOIC069"; }sOIC069;
bitmap{filename="OIC095.jpg"; description ="spatola"; }spatola30;
bitmap{filename="OIN085.jpg"; description ="culla"; }culla31;
bitmap{filename="FN_064.jpg"; description ="pescanoce01"; }pescanoce0132;
bitmap{filename="OIN004.jpg"; description ="altoparlanti"; }altoparlanti33;
bitmap{filename="sFN_004.jpg"; description ="sFN_004"; }sFN_004;
bitmap{filename="OIC111.jpg"; description ="teglia"; }teglia34;
bitmap{filename="sOIC020.jpg"; description ="sOIC020";  width = 477; height = 477; }sOIC020;
bitmap{filename="OIN033.jpg"; description ="palladabowling"; }palladabowling35;
	} array_img_right_encoding;


#dummy scan occupato con trial di istruzioni

trial{
trial_type=fixed;
	picture{ 
	bitmap {filename = "instr_RISE_ENC.jpg"; description = "instructions"; }bmp_instr_e;
	x= 0; y= 0;
	 }pic_instr_encoding;
duration = 10000; #five dummy scans
response_active=false;
mri_pulse=1;
}trial_instr_encoding;


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


#main trial encoding
trial{
trial_type=fixed;
	stimulus_event {
		picture{
			#bitmap pavone;
			#x = 400; y=0;
			#bitmap casco;
			#x = -400; y=0;
			bitmap {filename = ""; preload = false;} bmp_left_encoding;
			x= 410; y= 0; 
			bitmap {filename = ""; preload = false;} bmp_right_encoding;
			x =-410; y=0;
			} main_pic_encoding;
		#picture{
			#bitmap casco;
			#x = 400; y=0;
			#} main_pic_right;
duration = 2000; #mod durata da 3000 a 2000
response_active=true;
stimulus_time_in=0;
stimulus_time_out=2000;
		}main_event_encoding; 
	}main_trial_encoding;


####info necessarie

begin_pcl;
#preset string subject;
#preset string date;
#logfile.set_filename(subject + date + "_RISE.xls");
#encoding
int max_tr_e = 55;
array <string> code_e[max_tr_e] = {"stimulus","scrambled","scrambled","stimulus","crosshair","scrambled","scrambled","stimulus","stimulus","stimulus","crosshair","stimulus","stimulus","stimulus","crosshair","stimulus","stimulus","scrambled","scrambled","stimulus","crosshair","stimulus","stimulus","stimulus","stimulus","stimulus","crosshair","scrambled","stimulus","crosshair","stimulus","stimulus","stimulus","crosshair","scrambled","stimulus","stimulus","stimulus","stimulus","stimulus","stimulus","crosshair","stimulus","stimulus","stimulus","scrambled","crosshair","stimulus","stimulus","stimulus","stimulus","crosshair","stimulus","scrambled","stimulus"}; 
array <int> target_button_e[max_tr_e] = {2,1,1,1,0,2,2,2,1,1,0,1,1,1,0,2,2,2,1,2,0,1,1,2,1,2,0,2,2,0,2,2,2,0,1,2,1,1,1,2,1,0,1,1,2,2,0,2,1,2,2,0,1,1,2};
array <int> duration_xhair_e[max_tr_e] = {2500,1500,2250,2000,1500,2500,2250,2250,2500,1500,2250,2500,1500,2250,1750,1750,2000,2250,1750,1500,1750,2000,2250,2500,2500,2250,2000,2500,2000,1500,1500,1750,2250,2000,2500,1500,2000,1750,1500,1750,1500,2250,2500,2250,1750,2000,2500,2000,1500,2000,1750,2000,1750,2500,1750};

###ESPERIMENTO###
trial_instr_encoding.present();

loop   int i = 1;
until   i > max_tr_e
begin
   if (code_e[i] == "crosshair") then
      stimulus_ne.set_stimulus(pic_ne);
      stimulus_ne.set_target_button(0); # not a target
      trial_ne.present();
   elseif (code_e[i] == "stimulus") then 
	   array_img_left_encoding[i].load();
      main_pic_encoding.set_part(1, array_img_left_encoding[i]);
      array_img_right_encoding[i].load();
      main_pic_encoding.set_part(2, array_img_right_encoding[i]);
      main_event_encoding.set_stimulus(main_pic_encoding);
      main_event_encoding.set_target_button(target_button_e[i]);
      main_trial_encoding.present();
   elseif (code_e[i] == "scrambled") then 
	   array_img_left_encoding[i].load();
      main_pic_encoding.set_part(1, array_img_left_encoding[i]);
      array_img_right_encoding[i].load();
      main_pic_encoding.set_part(2, array_img_right_encoding[i]);
      main_event_encoding.set_stimulus(main_pic_encoding);
      main_event_encoding.set_target_button(target_button_e[i]);
      main_trial_encoding.present();
end;
stimulus_xhair.set_duration(duration_xhair_e[i]);
trial_xhair.present();
i = i + 1;
end;

