// Generated by Haxe 4.3.1
#include <hxcpp.h>

#ifndef INCLUDED_flixel_input_gamepad_FlxGamepadAttachment
#include <flixel/input/gamepad/FlxGamepadAttachment.h>
#endif
#ifndef INCLUDED_flixel_input_gamepad_FlxGamepadMappedInput
#include <flixel/input/gamepad/FlxGamepadMappedInput.h>
#endif
#ifndef INCLUDED_flixel_input_gamepad_FlxTypedGamepadAnalogStick
#include <flixel/input/gamepad/FlxTypedGamepadAnalogStick.h>
#endif
#ifndef INCLUDED_flixel_input_gamepad_id__MFiID_MFiID_Impl_
#include <flixel/input/gamepad/id/_MFiID/MFiID_Impl_.h>
#endif
#ifndef INCLUDED_flixel_input_gamepad_mappings_FlxTypedGamepadMapping
#include <flixel/input/gamepad/mappings/FlxTypedGamepadMapping.h>
#endif
#ifndef INCLUDED_flixel_input_gamepad_mappings_MFiMapping
#include <flixel/input/gamepad/mappings/MFiMapping.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_6a4fcdd8c98d6ad6_7_new,"flixel.input.gamepad.mappings.MFiMapping","new",0xf534e7d6,"flixel.input.gamepad.mappings.MFiMapping.new","flixel/input/gamepad/mappings/MFiMapping.hx",7,0xaa96aabc)
HX_LOCAL_STACK_FRAME(_hx_pos_6a4fcdd8c98d6ad6_10_initValues,"flixel.input.gamepad.mappings.MFiMapping","initValues",0x12bcc25c,"flixel.input.gamepad.mappings.MFiMapping.initValues","flixel/input/gamepad/mappings/MFiMapping.hx",10,0xaa96aabc)
HX_LOCAL_STACK_FRAME(_hx_pos_6a4fcdd8c98d6ad6_17_getID,"flixel.input.gamepad.mappings.MFiMapping","getID",0x524ef2e7,"flixel.input.gamepad.mappings.MFiMapping.getID","flixel/input/gamepad/mappings/MFiMapping.hx",17,0xaa96aabc)
HX_LOCAL_STACK_FRAME(_hx_pos_6a4fcdd8c98d6ad6_48_getRawID,"flixel.input.gamepad.mappings.MFiMapping","getRawID",0x62e58c17,"flixel.input.gamepad.mappings.MFiMapping.getRawID","flixel/input/gamepad/mappings/MFiMapping.hx",48,0xaa96aabc)
HX_LOCAL_STACK_FRAME(_hx_pos_6a4fcdd8c98d6ad6_85_getMappedInput,"flixel.input.gamepad.mappings.MFiMapping","getMappedInput",0xad013aab,"flixel.input.gamepad.mappings.MFiMapping.getMappedInput","flixel/input/gamepad/mappings/MFiMapping.hx",85,0xaa96aabc)
namespace flixel{
namespace input{
namespace gamepad{
namespace mappings{

void MFiMapping_obj::__construct( ::flixel::input::gamepad::FlxGamepadAttachment attachment){
            	HX_STACKFRAME(&_hx_pos_6a4fcdd8c98d6ad6_7_new)
HXDLIN(   7)		super::__construct(attachment);
            	}

Dynamic MFiMapping_obj::__CreateEmpty() { return new MFiMapping_obj; }

void *MFiMapping_obj::_hx_vtable = 0;

Dynamic MFiMapping_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< MFiMapping_obj > _hx_result = new MFiMapping_obj();
	_hx_result->__construct(inArgs[0]);
	return _hx_result;
}

bool MFiMapping_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x425bf69d) {
		return inClassId==(int)0x00000001 || inClassId==(int)0x425bf69d;
	} else {
		return inClassId==(int)0x63699f56;
	}
}

void MFiMapping_obj::initValues(){
            	HX_STACKFRAME(&_hx_pos_6a4fcdd8c98d6ad6_10_initValues)
HXLINE(  11)		this->leftStick = ::flixel::input::gamepad::id::_MFiID::MFiID_Impl__obj::LEFT_ANALOG_STICK;
HXLINE(  12)		this->rightStick = ::flixel::input::gamepad::id::_MFiID::MFiID_Impl__obj::RIGHT_ANALOG_STICK;
            	}


int MFiMapping_obj::getID( ::Dynamic _tmp_rawID){
            	HX_STACKFRAME(&_hx_pos_6a4fcdd8c98d6ad6_17_getID)
HXDLIN(  17)		int rawID = ( (int)(_tmp_rawID) );
HXDLIN(  17)		switch((int)(rawID)){
            			case (int)6: {
HXLINE(  19)				return 0;
            			}
            			break;
            			case (int)7: {
HXLINE(  20)				return 1;
            			}
            			break;
            			case (int)8: {
HXLINE(  21)				return 2;
            			}
            			break;
            			case (int)9: {
HXLINE(  22)				return 3;
            			}
            			break;
            			case (int)10: {
HXLINE(  23)				return 6;
            			}
            			break;
            			case (int)11: {
HXLINE(  24)				return 10;
            			}
            			break;
            			case (int)12: {
HXLINE(  25)				return 7;
            			}
            			break;
            			case (int)13: {
HXLINE(  26)				return 8;
            			}
            			break;
            			case (int)14: {
HXLINE(  27)				return 9;
            			}
            			break;
            			case (int)15: {
HXLINE(  28)				return 4;
            			}
            			break;
            			case (int)16: {
HXLINE(  29)				return 5;
            			}
            			break;
            			case (int)17: {
HXLINE(  30)				return 11;
            			}
            			break;
            			case (int)18: {
HXLINE(  31)				return 12;
            			}
            			break;
            			case (int)19: {
HXLINE(  32)				return 13;
            			}
            			break;
            			case (int)20: {
HXLINE(  33)				return 14;
            			}
            			break;
            			default:{
HXLINE(  34)				int id = rawID;
HXDLIN(  34)				if (::hx::IsEq( id,this->leftStick->rawUp )) {
HXLINE(  34)					return 34;
            				}
            				else {
HXLINE(  35)					int id1 = rawID;
HXDLIN(  35)					if (::hx::IsEq( id1,this->leftStick->rawDown )) {
HXLINE(  35)						return 36;
            					}
            					else {
HXLINE(  36)						int id2 = rawID;
HXDLIN(  36)						if (::hx::IsEq( id2,this->leftStick->rawLeft )) {
HXLINE(  36)							return 37;
            						}
            						else {
HXLINE(  37)							int id3 = rawID;
HXDLIN(  37)							if (::hx::IsEq( id3,this->leftStick->rawRight )) {
HXLINE(  37)								return 35;
            							}
            							else {
HXLINE(  38)								int id4 = rawID;
HXDLIN(  38)								if (::hx::IsEq( id4,this->rightStick->rawUp )) {
HXLINE(  38)									return 38;
            								}
            								else {
HXLINE(  39)									int id5 = rawID;
HXDLIN(  39)									if (::hx::IsEq( id5,this->rightStick->rawDown )) {
HXLINE(  39)										return 40;
            									}
            									else {
HXLINE(  40)										int id6 = rawID;
HXDLIN(  40)										if (::hx::IsEq( id6,this->rightStick->rawLeft )) {
HXLINE(  40)											return 41;
            										}
            										else {
HXLINE(  41)											int id7 = rawID;
HXDLIN(  41)											if (::hx::IsEq( id7,this->rightStick->rawRight )) {
HXLINE(  41)												return 39;
            											}
            											else {
HXLINE(  42)												return -1;
            											}
            										}
            									}
            								}
            							}
            						}
            					}
            				}
            			}
            		}
HXLINE(  17)		return null();
            	}


 ::Dynamic MFiMapping_obj::getRawID(int ID){
            	HX_STACKFRAME(&_hx_pos_6a4fcdd8c98d6ad6_48_getRawID)
HXDLIN(  48)		switch((int)(ID)){
            			case (int)0: {
HXLINE(  50)				return 6;
            			}
            			break;
            			case (int)1: {
HXLINE(  51)				return 7;
            			}
            			break;
            			case (int)2: {
HXLINE(  52)				return 8;
            			}
            			break;
            			case (int)3: {
HXLINE(  53)				return 9;
            			}
            			break;
            			case (int)4: {
HXLINE(  59)				return 15;
            			}
            			break;
            			case (int)5: {
HXLINE(  60)				return 16;
            			}
            			break;
            			case (int)6: {
HXLINE(  54)				return 10;
            			}
            			break;
            			case (int)7: {
HXLINE(  56)				return 12;
            			}
            			break;
            			case (int)8: {
HXLINE(  57)				return 13;
            			}
            			break;
            			case (int)9: {
HXLINE(  58)				return 14;
            			}
            			break;
            			case (int)10: {
HXLINE(  55)				return 11;
            			}
            			break;
            			case (int)11: {
HXLINE(  61)				return 17;
            			}
            			break;
            			case (int)12: {
HXLINE(  62)				return 18;
            			}
            			break;
            			case (int)13: {
HXLINE(  63)				return 19;
            			}
            			break;
            			case (int)14: {
HXLINE(  64)				return 20;
            			}
            			break;
            			case (int)17: {
HXLINE(  65)				return 4;
            			}
            			break;
            			case (int)18: {
HXLINE(  66)				return 5;
            			}
            			break;
            			case (int)34: {
HXLINE(  67)				return ::flixel::input::gamepad::id::_MFiID::MFiID_Impl__obj::LEFT_ANALOG_STICK->rawUp;
            			}
            			break;
            			case (int)35: {
HXLINE(  70)				return ::flixel::input::gamepad::id::_MFiID::MFiID_Impl__obj::LEFT_ANALOG_STICK->rawRight;
            			}
            			break;
            			case (int)36: {
HXLINE(  68)				return ::flixel::input::gamepad::id::_MFiID::MFiID_Impl__obj::LEFT_ANALOG_STICK->rawDown;
            			}
            			break;
            			case (int)37: {
HXLINE(  69)				return ::flixel::input::gamepad::id::_MFiID::MFiID_Impl__obj::LEFT_ANALOG_STICK->rawLeft;
            			}
            			break;
            			case (int)38: {
HXLINE(  71)				return ::flixel::input::gamepad::id::_MFiID::MFiID_Impl__obj::RIGHT_ANALOG_STICK->rawUp;
            			}
            			break;
            			case (int)39: {
HXLINE(  74)				return ::flixel::input::gamepad::id::_MFiID::MFiID_Impl__obj::RIGHT_ANALOG_STICK->rawRight;
            			}
            			break;
            			case (int)40: {
HXLINE(  72)				return ::flixel::input::gamepad::id::_MFiID::MFiID_Impl__obj::RIGHT_ANALOG_STICK->rawDown;
            			}
            			break;
            			case (int)41: {
HXLINE(  73)				return ::flixel::input::gamepad::id::_MFiID::MFiID_Impl__obj::RIGHT_ANALOG_STICK->rawLeft;
            			}
            			break;
            			default:{
HXLINE(  79)				return this->super::getRawID(ID);
            			}
            		}
HXLINE(  48)		return null();
            	}


 ::flixel::input::gamepad::FlxGamepadMappedInput MFiMapping_obj::getMappedInput(int id){
            	HX_STACKFRAME(&_hx_pos_6a4fcdd8c98d6ad6_85_getMappedInput)
HXDLIN(  85)		return ::flixel::input::gamepad::FlxGamepadMappedInput_obj::MFI(this->getRawID(id));
            	}



::hx::ObjectPtr< MFiMapping_obj > MFiMapping_obj::__new( ::flixel::input::gamepad::FlxGamepadAttachment attachment) {
	::hx::ObjectPtr< MFiMapping_obj > __this = new MFiMapping_obj();
	__this->__construct(attachment);
	return __this;
}

::hx::ObjectPtr< MFiMapping_obj > MFiMapping_obj::__alloc(::hx::Ctx *_hx_ctx, ::flixel::input::gamepad::FlxGamepadAttachment attachment) {
	MFiMapping_obj *__this = (MFiMapping_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(MFiMapping_obj), true, "flixel.input.gamepad.mappings.MFiMapping"));
	*(void **)__this = MFiMapping_obj::_hx_vtable;
	__this->__construct(attachment);
	return __this;
}

MFiMapping_obj::MFiMapping_obj()
{
}

::hx::Val MFiMapping_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"getID") ) { return ::hx::Val( getID_dyn() ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"getRawID") ) { return ::hx::Val( getRawID_dyn() ); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"initValues") ) { return ::hx::Val( initValues_dyn() ); }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"getMappedInput") ) { return ::hx::Val( getMappedInput_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo *MFiMapping_obj_sMemberStorageInfo = 0;
static ::hx::StaticInfo *MFiMapping_obj_sStaticStorageInfo = 0;
#endif

static ::String MFiMapping_obj_sMemberFields[] = {
	HX_("initValues",12,5f,fc,53),
	HX_("getID",f1,91,60,91),
	HX_("getRawID",4d,6f,fd,43),
	HX_("getMappedInput",61,6a,2c,47),
	::String(null()) };

::hx::Class MFiMapping_obj::__mClass;

void MFiMapping_obj::__register()
{
	MFiMapping_obj _hx_dummy;
	MFiMapping_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("flixel.input.gamepad.mappings.MFiMapping",e4,04,4b,f3);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(MFiMapping_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< MFiMapping_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = MFiMapping_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = MFiMapping_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace flixel
} // end namespace input
} // end namespace gamepad
} // end namespace mappings
