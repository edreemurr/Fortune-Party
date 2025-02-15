// Generated by Haxe 4.3.1
#ifndef INCLUDED_openfl_desktop_InteractiveIcon
#define INCLUDED_openfl_desktop_InteractiveIcon

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_openfl_desktop_Icon
#include <openfl/desktop/Icon.h>
#endif
HX_DECLARE_CLASS2(openfl,desktop,Icon)
HX_DECLARE_CLASS2(openfl,desktop,InteractiveIcon)
HX_DECLARE_CLASS2(openfl,events,EventDispatcher)
HX_DECLARE_CLASS2(openfl,events,IEventDispatcher)

namespace openfl{
namespace desktop{


class HXCPP_CLASS_ATTRIBUTES InteractiveIcon_obj : public  ::openfl::desktop::Icon_obj
{
	public:
		typedef  ::openfl::desktop::Icon_obj super;
		typedef InteractiveIcon_obj OBJ_;
		InteractiveIcon_obj();

	public:
		enum { _hx_ClassId = 0x684cf74f };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="openfl.desktop.InteractiveIcon")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"openfl.desktop.InteractiveIcon"); }
		static ::hx::ObjectPtr< InteractiveIcon_obj > __new();
		static ::hx::ObjectPtr< InteractiveIcon_obj > __alloc(::hx::Ctx *_hx_ctx);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~InteractiveIcon_obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		::hx::Val __SetField(const ::String &inString,const ::hx::Val &inValue, ::hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("InteractiveIcon",5b,f2,e2,ff); }

		int width;
		int height;
};

} // end namespace openfl
} // end namespace desktop

#endif /* INCLUDED_openfl_desktop_InteractiveIcon */ 
