// Generated by Haxe 4.3.1
#ifndef INCLUDED_flixel_graphics_frames_bmfont__BMFontXml_BMFontXml_Impl_
#define INCLUDED_flixel_graphics_frames_bmfont__BMFontXml_BMFontXml_Impl_

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS0(Xml)
HX_DECLARE_CLASS5(flixel,graphics,frames,bmfont,_BMFontXml,BMFontXml_Impl_)

namespace flixel{
namespace graphics{
namespace frames{
namespace bmfont{
namespace _BMFontXml{


class HXCPP_CLASS_ATTRIBUTES BMFontXml_Impl__obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef BMFontXml_Impl__obj OBJ_;
		BMFontXml_Impl__obj();

	public:
		enum { _hx_ClassId = 0x473d9d18 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="flixel.graphics.frames.bmfont._BMFontXml.BMFontXml_Impl_")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,false,"flixel.graphics.frames.bmfont._BMFontXml.BMFontXml_Impl_"); }

		inline static ::hx::ObjectPtr< BMFontXml_Impl__obj > __new() {
			::hx::ObjectPtr< BMFontXml_Impl__obj > __this = new BMFontXml_Impl__obj();
			__this->__construct();
			return __this;
		}

		inline static ::hx::ObjectPtr< BMFontXml_Impl__obj > __alloc(::hx::Ctx *_hx_ctx) {
			BMFontXml_Impl__obj *__this = (BMFontXml_Impl__obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(BMFontXml_Impl__obj), false, "flixel.graphics.frames.bmfont._BMFontXml.BMFontXml_Impl_"));
			*(void **)__this = BMFontXml_Impl__obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~BMFontXml_Impl__obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("BMFontXml_Impl_",1d,89,02,c2); }

		static  ::Xml get_xml( ::Xml this1);
		static ::Dynamic get_xml_dyn();

		static ::String get_name( ::Xml this1);
		static ::Dynamic get_name_dyn();

		static  ::Xml get_node( ::Xml this1);
		static ::Dynamic get_node_dyn();

		static  ::Xml get_att( ::Xml this1);
		static ::Dynamic get_att_dyn();

		static  ::Dynamic get_elements( ::Xml this1);
		static ::Dynamic get_elements_dyn();

		static  ::Xml _new( ::Xml xml);
		static ::Dynamic _new_dyn();

		static bool has( ::Xml this1,::String name);
		static ::Dynamic has_dyn();

		static bool hasNode( ::Xml this1,::String name);
		static ::Dynamic hasNode_dyn();

		static ::Array< ::Dynamic> nodes( ::Xml this1,::String name);
		static ::Dynamic nodes_dyn();

};

} // end namespace flixel
} // end namespace graphics
} // end namespace frames
} // end namespace bmfont
} // end namespace _BMFontXml

#endif /* INCLUDED_flixel_graphics_frames_bmfont__BMFontXml_BMFontXml_Impl_ */ 
