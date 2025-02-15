// Generated by Haxe 4.3.1
#ifndef INCLUDED_flixel_input_gamepad_id__MayflashWiiRemoteID_MayflashWiiRemoteID_Impl_
#define INCLUDED_flixel_input_gamepad_id__MayflashWiiRemoteID_MayflashWiiRemoteID_Impl_

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS3(flixel,input,gamepad,FlxTypedGamepadAnalogStick)
HX_DECLARE_CLASS5(flixel,input,gamepad,id,_MayflashWiiRemoteID,MayflashWiiRemoteID_Impl_)

namespace flixel{
namespace input{
namespace gamepad{
namespace id{
namespace _MayflashWiiRemoteID{


class HXCPP_CLASS_ATTRIBUTES MayflashWiiRemoteID_Impl__obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef MayflashWiiRemoteID_Impl__obj OBJ_;
		MayflashWiiRemoteID_Impl__obj();

	public:
		enum { _hx_ClassId = 0x7ee9bac1 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="flixel.input.gamepad.id._MayflashWiiRemoteID.MayflashWiiRemoteID_Impl_")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"flixel.input.gamepad.id._MayflashWiiRemoteID.MayflashWiiRemoteID_Impl_"); }

		inline static ::hx::ObjectPtr< MayflashWiiRemoteID_Impl__obj > __new() {
			::hx::ObjectPtr< MayflashWiiRemoteID_Impl__obj > __this = new MayflashWiiRemoteID_Impl__obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< MayflashWiiRemoteID_Impl__obj > __alloc(::hx::Ctx *_hx_ctx) {
			MayflashWiiRemoteID_Impl__obj *__this = (MayflashWiiRemoteID_Impl__obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(MayflashWiiRemoteID_Impl__obj), false, "flixel.input.gamepad.id._MayflashWiiRemoteID.MayflashWiiRemoteID_Impl_"));
			*(void **)__this = MayflashWiiRemoteID_Impl__obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~MayflashWiiRemoteID_Impl__obj();

		HX_DO_RTTI_ALL;
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("MayflashWiiRemoteID_Impl_",2d,2c,31,58); }

		static void __boot();
		static int REMOTE_ONE;
		static int REMOTE_TWO;
		static int REMOTE_A;
		static int REMOTE_B;
		static int REMOTE_MINUS;
		static int REMOTE_PLUS;
		static int REMOTE_HOME;
		static int NUNCHUK_Z;
		static int NUNCHUK_C;
		static int NUNCHUK_DPAD_UP;
		static int NUNCHUK_DPAD_DOWN;
		static int NUNCHUK_DPAD_LEFT;
		static int NUNCHUK_DPAD_RIGHT;
		static int NUNCHUK_MINUS;
		static int NUNCHUK_PLUS;
		static int NUNCHUK_HOME;
		static int NUNCHUK_A;
		static int NUNCHUK_B;
		static int NUNCHUK_ONE;
		static int NUNCHUK_TWO;
		static int CLASSIC_Y;
		static int CLASSIC_X;
		static int CLASSIC_B;
		static int CLASSIC_A;
		static int CLASSIC_L;
		static int CLASSIC_R;
		static int CLASSIC_ZL;
		static int CLASSIC_ZR;
		static int CLASSIC_SELECT;
		static int CLASSIC_START;
		static int CLASSIC_HOME;
		static int CLASSIC_ONE;
		static int CLASSIC_TWO;
		static int CLASSIC_DPAD_UP;
		static int CLASSIC_DPAD_DOWN;
		static int CLASSIC_DPAD_LEFT;
		static int CLASSIC_DPAD_RIGHT;
		static int NUNCHUK_POINTER_X;
		static int NUNCHUK_POINTER_Y;
		static int LEFT_STICK_UP;
		static int LEFT_STICK_DOWN;
		static int LEFT_STICK_LEFT;
		static int LEFT_STICK_RIGHT;
		static int RIGHT_STICK_UP;
		static int RIGHT_STICK_DOWN;
		static int RIGHT_STICK_LEFT;
		static int RIGHT_STICK_RIGHT;
		static int LEFT_TRIGGER_FAKE;
		static int RIGHT_TRIGGER_FAKE;
		static int REMOTE_DPAD_UP;
		static int REMOTE_DPAD_DOWN;
		static int REMOTE_DPAD_LEFT;
		static int REMOTE_DPAD_RIGHT;
		static  ::flixel::input::gamepad::FlxTypedGamepadAnalogStick REMOTE_DPAD;
		static  ::flixel::input::gamepad::FlxTypedGamepadAnalogStick LEFT_ANALOG_STICK;
		static  ::flixel::input::gamepad::FlxTypedGamepadAnalogStick RIGHT_ANALOG_STICK;
};

} // end namespace flixel
} // end namespace input
} // end namespace gamepad
} // end namespace id
} // end namespace _MayflashWiiRemoteID

#endif /* INCLUDED_flixel_input_gamepad_id__MayflashWiiRemoteID_MayflashWiiRemoteID_Impl_ */ 
