// Generated by Haxe 4.3.1
#include <hxcpp.h>

#ifndef INCLUDED_flixel_graphics_frames_bmfont_BMFont
#include <flixel/graphics/frames/bmfont/BMFont.h>
#endif
#ifndef INCLUDED_flixel_system__FlxAssets_FlxAngelCodeAsset_Impl_
#include <flixel/system/_FlxAssets/FlxAngelCodeAsset_Impl_.h>
#endif

HX_LOCAL_STACK_FRAME(_hx_pos_eacd59df718e3049_48_parse,"flixel.system._FlxAssets.FlxAngelCodeAsset_Impl_","parse",0x14fd3e6e,"flixel.system._FlxAssets.FlxAngelCodeAsset_Impl_.parse","flixel/system/FlxAssets.hx",48,0xd3ac1356)
namespace flixel{
namespace _hx_system{
namespace _FlxAssets{

void FlxAngelCodeAsset_Impl__obj::__construct() { }

Dynamic FlxAngelCodeAsset_Impl__obj::__CreateEmpty() { return new FlxAngelCodeAsset_Impl__obj; }

void *FlxAngelCodeAsset_Impl__obj::_hx_vtable = 0;

Dynamic FlxAngelCodeAsset_Impl__obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< FlxAngelCodeAsset_Impl__obj > _hx_result = new FlxAngelCodeAsset_Impl__obj();
	_hx_result->__construct();
	return _hx_result;
}

bool FlxAngelCodeAsset_Impl__obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x534d6f0f;
}

 ::flixel::graphics::frames::bmfont::BMFont FlxAngelCodeAsset_Impl__obj::parse( ::Dynamic this1){
            	HX_STACKFRAME(&_hx_pos_eacd59df718e3049_48_parse)
HXDLIN(  48)		return ::flixel::graphics::frames::bmfont::BMFont_obj::parse(this1);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(FlxAngelCodeAsset_Impl__obj,parse,return )


FlxAngelCodeAsset_Impl__obj::FlxAngelCodeAsset_Impl__obj()
{
}

bool FlxAngelCodeAsset_Impl__obj::__GetStatic(const ::String &inName, Dynamic &outValue, ::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"parse") ) { outValue = parse_dyn(); return true; }
	}
	return false;
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo *FlxAngelCodeAsset_Impl__obj_sMemberStorageInfo = 0;
static ::hx::StaticInfo *FlxAngelCodeAsset_Impl__obj_sStaticStorageInfo = 0;
#endif

::hx::Class FlxAngelCodeAsset_Impl__obj::__mClass;

static ::String FlxAngelCodeAsset_Impl__obj_sStaticFields[] = {
	HX_("parse",33,90,55,bd),
	::String(null())
};

void FlxAngelCodeAsset_Impl__obj::__register()
{
	FlxAngelCodeAsset_Impl__obj _hx_dummy;
	FlxAngelCodeAsset_Impl__obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("flixel.system._FlxAssets.FlxAngelCodeAsset_Impl_",69,60,27,01);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &FlxAngelCodeAsset_Impl__obj::__GetStatic;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(FlxAngelCodeAsset_Impl__obj_sStaticFields);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = ::hx::TCanCast< FlxAngelCodeAsset_Impl__obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = FlxAngelCodeAsset_Impl__obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = FlxAngelCodeAsset_Impl__obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace flixel
} // end namespace system
} // end namespace _FlxAssets
