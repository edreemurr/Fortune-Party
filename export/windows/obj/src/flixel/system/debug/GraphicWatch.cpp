// Generated by Haxe 4.3.1
#include <hxcpp.h>

#ifndef INCLUDED_flixel_system_debug_GraphicWatch
#include <flixel/system/debug/GraphicWatch.h>
#endif
#ifndef INCLUDED_openfl_display_BitmapData
#include <openfl/display/BitmapData.h>
#endif
#ifndef INCLUDED_openfl_display_IBitmapDrawable
#include <openfl/display/IBitmapDrawable.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_6ccb06d407f389af_42_new,"flixel.system.debug.GraphicWatch","new",0xb737cfa1,"flixel.system.debug.GraphicWatch.new","flixel/system/debug/FlxDebugger.hx",42,0xd9fc0a74)
namespace flixel{
namespace _hx_system{
namespace debug{

void GraphicWatch_obj::__construct(int width,int height, ::Dynamic transparent, ::Dynamic fillColor){
            	HX_STACKFRAME(&_hx_pos_6ccb06d407f389af_42_new)
HXDLIN(  42)		super::__construct(width,height,transparent,fillColor);
            	}

Dynamic GraphicWatch_obj::__CreateEmpty() { return new GraphicWatch_obj; }

void *GraphicWatch_obj::_hx_vtable = 0;

Dynamic GraphicWatch_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< GraphicWatch_obj > _hx_result = new GraphicWatch_obj();
	_hx_result->__construct(inArgs[0],inArgs[1],inArgs[2],inArgs[3]);
	return _hx_result;
}

bool GraphicWatch_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x073e5103) {
		return inClassId==(int)0x00000001 || inClassId==(int)0x073e5103;
	} else {
		return inClassId==(int)0x709d2b8f;
	}
}


::hx::ObjectPtr< GraphicWatch_obj > GraphicWatch_obj::__new(int width,int height, ::Dynamic transparent, ::Dynamic fillColor) {
	::hx::ObjectPtr< GraphicWatch_obj > __this = new GraphicWatch_obj();
	__this->__construct(width,height,transparent,fillColor);
	return __this;
}

::hx::ObjectPtr< GraphicWatch_obj > GraphicWatch_obj::__alloc(::hx::Ctx *_hx_ctx,int width,int height, ::Dynamic transparent, ::Dynamic fillColor) {
	GraphicWatch_obj *__this = (GraphicWatch_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(GraphicWatch_obj), true, "flixel.system.debug.GraphicWatch"));
	*(void **)__this = GraphicWatch_obj::_hx_vtable;
	__this->__construct(width,height,transparent,fillColor);
	return __this;
}

GraphicWatch_obj::GraphicWatch_obj()
{
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo *GraphicWatch_obj_sMemberStorageInfo = 0;
static ::hx::StaticInfo *GraphicWatch_obj_sStaticStorageInfo = 0;
#endif

::hx::Class GraphicWatch_obj::__mClass;

void GraphicWatch_obj::__register()
{
	GraphicWatch_obj _hx_dummy;
	GraphicWatch_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("flixel.system.debug.GraphicWatch",2f,6b,15,7a);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = ::hx::TCanCast< GraphicWatch_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = GraphicWatch_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = GraphicWatch_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace flixel
} // end namespace system
} // end namespace debug
