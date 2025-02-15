// Generated by Haxe 4.3.1
#ifndef INCLUDED_lime_net_curl_CURL
#define INCLUDED_lime_net_curl_CURL

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS2(haxe,io,Bytes)
HX_DECLARE_CLASS3(lime,net,curl,CURL)

namespace lime{
namespace net{
namespace curl{


class HXCPP_CLASS_ATTRIBUTES CURL_obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef CURL_obj OBJ_;
		CURL_obj();

	public:
		enum { _hx_ClassId = 0x055fdc1c };

		void __construct( ::Dynamic handle);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="lime.net.curl.CURL")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"lime.net.curl.CURL"); }
		static ::hx::ObjectPtr< CURL_obj > __new( ::Dynamic handle);
		static ::hx::ObjectPtr< CURL_obj > __alloc(::hx::Ctx *_hx_ctx, ::Dynamic handle);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~CURL_obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		::hx::Val __SetField(const ::String &inString,const ::hx::Val &inValue, ::hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("CURL",ec,12,8a,2c); }

		static void __boot();
		static int GLOBAL_SSL;
		static int GLOBAL_WIN32;
		static int GLOBAL_ALL;
		static int GLOBAL_NOTHING;
		static int GLOBAL_DEFAULT;
		static int GLOBAL_ACK_EINTR;
		static int getDate(::String date,int now);
		static ::Dynamic getDate_dyn();

		static void globalCleanup();
		static ::Dynamic globalCleanup_dyn();

		static int globalInit(int flags);
		static ::Dynamic globalInit_dyn();

		static ::String strerror(int code);
		static ::Dynamic strerror_dyn();

		static ::String version();
		static ::Dynamic version_dyn();

		static  ::Dynamic versionInfo(int type);
		static ::Dynamic versionInfo_dyn();

		 ::Dynamic handle;
		 ::haxe::io::Bytes headerBytes;
		 ::haxe::io::Bytes writeBytes;
		void cleanup();
		::Dynamic cleanup_dyn();

		 ::lime::net::curl::CURL clone();
		::Dynamic clone_dyn();

		::String escape(::String url,int length);
		::Dynamic escape_dyn();

		 ::Dynamic getInfo(int info);
		::Dynamic getInfo_dyn();

		int pause(int bitMask);
		::Dynamic pause_dyn();

		int perform();
		::Dynamic perform_dyn();

		void reset();
		::Dynamic reset_dyn();

		int setOption(int option, ::Dynamic parameter);
		::Dynamic setOption_dyn();

		::String unescape(::String url,int inLength,int outLength);
		::Dynamic unescape_dyn();

};

} // end namespace lime
} // end namespace net
} // end namespace curl

#endif /* INCLUDED_lime_net_curl_CURL */ 
