//Copyright (c) 2011-2020 <>< Charles Lohr - Under the MIT/x11 or NewBSD License you choose.
// NO WARRANTY! NO GUARANTEE OF SUPPORT! USE AT YOUR OWN RISK
// C++ translation by Kronka

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include "rawdraw/os_generic.h"
#include <GLES3/gl3.h>
#include <android/asset_manager.h>
#include <android/asset_manager_jni.h>
#include "vendor/android_native_app_glue/android_native_app_glue.h"
#include <android/sensor.h>
#include "rawdraw/CNFGAndroid.h"
#include <pthread.h>

#define CNFG_IMPLEMENTATION
#define CNFG3D

#include "rawdraw/CNFG.h"

#include "main.h"

float mountainangle;
float mountainoffsetx;
float mountainoffsety;

ASensorManager * sm;
const ASensor * as;
bool no_sensor_for_gyro = false;
ASensorEventQueue* aeq;
ALooper * l;

unsigned frames = 0;
unsigned long iframeno = 0;

void AndroidDisplayKeyboard(int pShow);

int lastbuttonx = 0;
int lastbuttony = 0;
int lastmotionx = 0;
int lastmotiony = 0;
int lastbid = 0;
int lastmask = 0;
int lastkey, lastkeydown;

static int keyboard_up;

void HandleKey( int keycode, int bDown )
{
	lastkey = keycode;
	lastkeydown = bDown;
	if( keycode == 10 && !bDown ) { keyboard_up = 0; AndroidDisplayKeyboard( keyboard_up );  }

	if( keycode == 4 ) { AndroidSendToBack( 1 ); } //Handle Physical Back Button.
}

void HandleButton( int x, int y, int button, int bDown )
{
	lastbid = button;
	lastbuttonx = x;
	lastbuttony = y;

	if( bDown ) { keyboard_up = !keyboard_up; AndroidDisplayKeyboard( keyboard_up ); }
}

void HandleMotion( int x, int y, int mask )
{
	lastmask = mask;
	lastmotionx = x;
	lastmotiony = y;
}

short DisplaySizeX, DisplaySizeY;
short GetX, GetY;

extern struct android_app * gapp;

void HandleDestroy()
{
	Log( "Destroying" );
	exit(10);
}

volatile int suspended;

void HandleSuspend()
{
	suspended = 1;
}

void HandleResume()
{
	suspended = 0;
}

//int main()
int main( int argc, char ** argv )
{


	return 0;
}

void Log(const char *fmt, ...)
{	
	//const char* getpath = AndroidGetExternalFilesDir();
	char buffer[0xFF];
	//static FILE* flLog = NULL;

	/*if(flLog == NULL)
	{
		sprintf(buffer, "%s/log.txt", getpath);
		flLog = fopen(buffer, "a");
	}*/

	memset(buffer, 0, sizeof(buffer));

	va_list arg;
	va_start(arg, fmt);
	vsnprintf(buffer, sizeof(buffer), fmt, arg);
	va_end(arg);
	
	__android_log_write(ANDROID_LOG_INFO, "BOEVTOP", buffer);
	
	/*
	char buf[80];
	time_t seconds = time(NULL);
	struct tm* timeinfo = localtime(&seconds);
	//const char* format = BOEV("%d.%m.%y %H:%M:%S");
	const char* format = "%H:%M:%S";
	strftime(buf, 80, format, timeinfo);

	if(flLog == NULL) return;
	fprintf(flLog, "[%s] %s\n", buf,buffer);
	fflush(flLog);
	*/
	return;	
}
