// Generated by Haxe 4.3.1
#ifndef INCLUDED_openfl_utils__internal_format_amf3_AMF3Reader
#define INCLUDED_openfl_utils__internal_format_amf3_AMF3Reader

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS2(haxe,io,Input)
HX_DECLARE_CLASS5(openfl,utils,_internal,format,amf3,AMF3Reader)
HX_DECLARE_CLASS5(openfl,utils,_internal,format,amf3,AMF3Value)

namespace openfl{
namespace utils{
namespace _internal{
namespace format{
namespace amf3{


class HXCPP_CLASS_ATTRIBUTES AMF3Reader_obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef AMF3Reader_obj OBJ_;
		AMF3Reader_obj();

	public:
		enum { _hx_ClassId = 0x09dc9707 };

		void __construct( ::haxe::io::Input i, ::openfl::utils::_internal::format::amf3::AMF3Reader parent);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="openfl.utils._internal.format.amf3.AMF3Reader")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"openfl.utils._internal.format.amf3.AMF3Reader"); }
		static ::hx::ObjectPtr< AMF3Reader_obj > __new( ::haxe::io::Input i, ::openfl::utils::_internal::format::amf3::AMF3Reader parent);
		static ::hx::ObjectPtr< AMF3Reader_obj > __alloc(::hx::Ctx *_hx_ctx, ::haxe::io::Input i, ::openfl::utils::_internal::format::amf3::AMF3Reader parent);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~AMF3Reader_obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		::hx::Val __SetField(const ::String &inString,const ::hx::Val &inValue, ::hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("AMF3Reader",3c,fb,3c,63); }

		::Array< ::Dynamic> complexObjectsTable;
		::Array< ::Dynamic> objectTraitsTable;
		::Array< ::Dynamic> stringTable;
		 ::haxe::io::Input i;
		 ::openfl::utils::_internal::format::amf3::AMF3Value readObject();
		::Dynamic readObject_dyn();

		 ::openfl::utils::_internal::format::amf3::AMF3Value readMap();
		::Dynamic readMap_dyn();

		 ::openfl::utils::_internal::format::amf3::AMF3Value readArray();
		::Dynamic readArray_dyn();

		 ::openfl::utils::_internal::format::amf3::AMF3Value readIntVector();
		::Dynamic readIntVector_dyn();

		 ::openfl::utils::_internal::format::amf3::AMF3Value readFloatVector();
		::Dynamic readFloatVector_dyn();

		 ::openfl::utils::_internal::format::amf3::AMF3Value readObjectVector();
		::Dynamic readObjectVector_dyn();

		 ::openfl::utils::_internal::format::amf3::AMF3Value readByteArray();
		::Dynamic readByteArray_dyn();

		int readInt(::hx::Null< bool >  signExtend,::hx::Null< int >  preShift);
		::Dynamic readInt_dyn();

		 ::openfl::utils::_internal::format::amf3::AMF3Value readString();
		::Dynamic readString_dyn();

		 ::openfl::utils::_internal::format::amf3::AMF3Value readStringNoHeader(int len);
		::Dynamic readStringNoHeader_dyn();

		 ::openfl::utils::_internal::format::amf3::AMF3Value readDate();
		::Dynamic readDate_dyn();

		 ::openfl::utils::_internal::format::amf3::AMF3Value readXml();
		::Dynamic readXml_dyn();

		 ::openfl::utils::_internal::format::amf3::AMF3Value readWithCode(int id);
		::Dynamic readWithCode_dyn();

		 ::openfl::utils::_internal::format::amf3::AMF3Value read();
		::Dynamic read_dyn();

};

} // end namespace openfl
} // end namespace utils
} // end namespace _internal
} // end namespace format
} // end namespace amf3

#endif /* INCLUDED_openfl_utils__internal_format_amf3_AMF3Reader */ 
