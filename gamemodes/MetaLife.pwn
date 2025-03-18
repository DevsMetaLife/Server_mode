#include <a_samp>
#include <a_mysql>
//===================================
#define         developer                 "Devs_dev"
#define         data_start              "02.03.2025"
#define         game_mode               "MetaLife"
#define         name_server             "MetaLife Online"
#define         host_name               "MetaLife Online"
#define         language                "Russia"
//===================================
#define         color_main              0xbb7dffAA
#define         color_white             0xffffffAA
#define         color_red               0xd54a4aAA
#define         color_blue              0x55adffAA
#define         color_green             0x7aca74AA
#define         color_orange            0xffad55AA
#define         color_yellow            0xf9b961AA
#define         color_purple            0xea8afdAA
#define         color_gray              0x999999AA
#define         color_brown             0x97754fAA
#define         color_black             0x080808AA
#define         color_achat                     0xd7ff9fAA
#define         color_lightyellow       0xe1daa3AA
#define         color_lightred          0xff6347AA
//===================================
#define         c_main                  "{bb7dff}"
#define         c_white                 "{ffffff}"
#define         c_red                   "{d54a4a}"
#define         c_blue                  "{55adff}"
#define         c_green                 "{7aca74}"
#define         c_orange                "{ffad55}"
#define         c_yellow                "{f9b961}"
#define         c_purple                "{ea8afd}"
#define         c_gray                  "{999999}"
#define         c_brown                 "{97754f}"
#define         c_black                 "{080808}"
#define         c_lightyellow           "{e1daa3}"
#define         c_lightred              "{ff6347}"
//===================================

//===================================
#define         SPD                     ShowPlayerDialog
#define         DSI                     DIALOG_STYLE_INPUT
#define         DSM                     DIALOG_STYLE_MSGBOX
#define         DSP                     DIALOG_STYLE_PASSWORD
#define         DSL                     DIALOG_STYLE_LIST
#define         SCM                     SendClientMessage
//===================================

new MySQL:dbHandle;

#define Host "127.0.0.1"
#define User "root"
#define DataBase "MetaLife"
#define Password_SQL ""

//===================================
enum DLG
{
	DLG_NONE, // net
	DLG_REG, // regestracija
	DLG_PG,
};

enum PLAYER_INFO
{
	P_ID,
	P_NICK,
	P_PASS,
	P_GENDER
};
new player_info[MAX_PLAYERS][PLAYER_INFO];
new query[256];
//====================================
main()
{
	print("\n----------------------------------");
	print(" MetaLife Online");
	print("----------------------------------\n");
}



public OnGameModeInit()
{
 	dbHandle = mysql_connect(Host,User,Password_SQL,DataBase);
	if(mysql_errno())
    {
        printf("Подключение к базе данных %s не удалось.",DataBase); // %s означает строку. То есть будет выводить название базы данных которое указано в #define DataBase
    }
    else
    {
        printf("Подключение к базе данных %s успешно",DataBase);
    }
	SetGameModeText("MetaLife Online");
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	AddStaticVehicle(599,2473.1475,-1706.4584,13.5271,356.0308, 1 ,1);
	return 1;
}

public OnGameModeExit()
{
    mysql_close(dbHandle);
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{

	SetPlayerPos(playerid, 2534.7480,2427.5808,54.9348);
	InterpolateCameraPos(playerid, 2552.605224, 2426.749267, 22.178434, 2552.605224, 2426.749267, 22.178434, 1000);
	InterpolateCameraLookAt(playerid, 2555.998535, 2423.079589, 22.311231, 2555.998535, 2423.079589, 22.311231, 1000);

	return 1;
}

public OnPlayerConnect(playerid)
{
	GetPlayerName(playerid, player_info[playerid][P_NICK], MAX_PLAYER_NAME);
	SetTimerEx("GetUserFromMySql", 1000, false, "i", playerid);
	SetPlayerMapIcon(playerid, 1, -402.779, 1009.8, 13.2477, 63, 0, MAPICON_LOCAL); // ARZAMAS
	SetPlayerMapIcon(playerid, 2, -1611.46, 1544.69, 36.2602, 63, 0, MAPICON_LOCAL); // SCHWARZ
	SetPlayerMapIcon(playerid, 3, -2147.51, -94.3456, 26.2668, 63, 0, MAPICON_LOCAL); // LYTKARINO
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
   // SetPlayerSkin(playerid, 249);
	new rspawn1 = random(4);
	switch(rspawn1)
 	{
 	    case 0:
 	    {
			SetPlayerPos(playerid, 499.8784,-1686.9775,13.5019);
            SetPlayerFacingAngle(playerid, 15.1442);
            SetCameraBehindPlayer(playerid);
		}

		case 1:
		{
			SetPlayerPos(playerid, 2512.5254,-1672.8090,13.4991);
            SetPlayerFacingAngle(playerid, 69.3516);
            SetCameraBehindPlayer(playerid);
		}

		case 2:
		{
			SetPlayerPos(playerid, 2499.2354,-1651.4711,13.5223);
            SetPlayerFacingAngle(playerid, 171.8125);
            SetCameraBehindPlayer(playerid);
		}




 	}
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	new str[256];
	switch(dialogid)
	{
	    case DLG_REG:
	    {
			if(!response) return Kick(playerid);
			if(!(strlen(inputtext)>= 8 && strlen(inputtext) <= 22))
			{
			    SCM(playerid, color_red, "Длинна пороля должна быть от 8 до 22 символов");
				format(str, sizeof(str), "{ffffff} Аккаунт с ником %s Не имееться\nДля Регестрации введите пароль в поле ниже.\n", player_info[playerid][P_NICK], playerid);
 				return SPD(playerid, DLG_REG,DSP, "Регестрация",str ,"Войти" ,"Выйти" );
			}
			for (new i =0; i < strlen(inputtext); i++)
			{
				switch(inputtext[i])
				{
					case 'a'..'z', 'A'..'Z', '0'..'9': continue;
					default:
					{
				SCM(playerid, color_red, "Пароль должен состоять из латинских A-Z и 0-9");
				format(str, sizeof(str), "{ffffff} Аккаунт с ником %s Не имееться\nДля Регестрации введите пароль в поле ниже.\n", player_info[playerid][P_NICK], playerid);
 				return SPD(playerid, DLG_REG,DSP, "Регестрация",str ,"Войти" ,"Выйти" );
					}
				}
			}
			player_info[playerid][P_PASS]= EOS;
			strins(player_info[playerid][P_PASS], inputtext ,0);
			format(str, sizeof(str),"{ffffff} Выберите пол персонажа" );
			SPD(playerid, DLG_PG, DSM, "Регестрация", str ,"Мужской" ,"Женский");
		}
		case DLG_PG:
		{
			if(!response) player_info[playerid][P_GENDER] = 2;
			if(response) player_info[playerid][P_GENDER] = 1;
			
		}
		

	}// ид скинов -272 216
	switch(player_info[playerid][P_GENDER])
	{
		case 0:
		{
			if(player_info[playerid][P_GENDER] == 1)
			{
                SetPlayerSkin(playerid, 187);
			}
		}
		case 1:
		{
			if(player_info[playerid][P_GENDER] == 2)
			{
                SetPlayerSkin(playerid, 194);
			}
		}

	}
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
	return SetPlayerPos(playerid,fX,fY,fZ);
}
forward GetUserFromMySql(playerid);
public GetUserFromMySql(playerid)
{
	format(query, sizeof(query), "SELECT * FROM `users` WHERE 'Nick' = '%s'",player_info[playerid][P_NICK]);
	mysql_tquery(dbHandle, query,"CheckUserFromMySql", "i", playerid );
	return 1;
}
forward CheckUserFromMySql(playerid);
public CheckUserFromMySql(playerid)
{
	new str[256];
	if(cache_num_rows() == 0)
	{
	    format(str, sizeof(str),"{ffffff} Аккаунт с ником %s Не имееться\nДля Регестрации введите пароль в поле ниже.\n", player_info[playerid][P_NICK], playerid);
	    SPD(playerid, DLG_REG,DSP, "Регестрация",str ,"Войти" ,"Выйти" );
	}
	else
	{
        SCM(playerid,color_green , "Вы  зарегестрированый");
 	}
	return 1;
}
