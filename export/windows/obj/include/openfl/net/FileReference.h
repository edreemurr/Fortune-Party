// Generated by Haxe 4.3.1
#ifndef INCLUDED_openfl_net_FileReference
#define INCLUDED_openfl_net_FileReference

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_openfl_events_EventDispatcher
#include <openfl/events/EventDispatcher.h>
#endif
HX_DECLARE_CLASS0(Date)
HX_DECLARE_CLASS2(haxe,io,Bytes)
HX_DECLARE_CLASS2(openfl,events,ErrorEvent)
HX_DECLARE_CLASS2(openfl,events,Event)
HX_DECLARE_CLASS2(openfl,events,EventDispatcher)
HX_DECLARE_CLASS2(openfl,events,HTTPStatusEvent)
HX_DECLARE_CLASS2(openfl,events,IEventDispatcher)
HX_DECLARE_CLASS2(openfl,events,IOErrorEvent)
HX_DECLARE_CLASS2(openfl,events,ProgressEvent)
HX_DECLARE_CLASS2(openfl,events,TextEvent)
HX_DECLARE_CLASS2(openfl,net,FileFilter)
HX_DECLARE_CLASS2(openfl,net,FileReference)
HX_DECLARE_CLASS2(openfl,net,URLLoader)
HX_DECLARE_CLASS2(openfl,net,URLRequest)
HX_DECLARE_CLASS2(openfl,utils,ByteArrayData)
HX_DECLARE_CLASS2(openfl,utils,IDataInput)
HX_DECLARE_CLASS2(openfl,utils,IDataOutput)

namespace openfl{
namespace net{


class HXCPP_CLASS_ATTRIBUTES FileReference_obj : public  ::openfl::events::EventDispatcher_obj
{
	public:
		typedef  ::openfl::events::EventDispatcher_obj super;
		typedef FileReference_obj OBJ_;
		FileReference_obj();

	public:
		enum { _hx_ClassId = 0x0c1b0022 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="openfl.net.FileReference")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"openfl.net.FileReference"); }
		static ::hx::ObjectPtr< FileReference_obj > __new();
		static ::hx::ObjectPtr< FileReference_obj > __alloc(::hx::Ctx *_hx_ctx);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~FileReference_obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		::hx::Val __SetField(const ::String &inString,const ::hx::Val &inValue, ::hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("FileReference",8f,b9,f4,41); }

		 ::Date creationDate;
		::String creator;
		 ::openfl::utils::ByteArrayData data;
		 ::Date modificationDate;
		::String name;
		Float size;
		::String type;
		::String extension;
		 ::openfl::utils::ByteArrayData _hx___data;
		::String _hx___path;
		 ::openfl::net::URLLoader _hx___urlLoader;
		virtual bool browse(::Array< ::Dynamic> typeFilter);
		::Dynamic browse_dyn();

		virtual void cancel();
		::Dynamic cancel_dyn();

		void download( ::openfl::net::URLRequest request,::String defaultFileName);
		::Dynamic download_dyn();

		void load();
		::Dynamic load_dyn();

		void save( ::Dynamic data,::String defaultFileName);
		::Dynamic save_dyn();

		void upload( ::openfl::net::URLRequest request,::String uploadDataFieldName,::hx::Null< bool >  testUpload);
		::Dynamic upload_dyn();

		void _hx___uploadFileBytes( ::openfl::net::URLRequest request,::String uploadDataFieldName, ::openfl::utils::ByteArrayData fileBytes);
		::Dynamic _hx___uploadFileBytes_dyn();

		void openFileDialog_onCancel();
		::Dynamic openFileDialog_onCancel_dyn();

		void openFileDialog_onComplete();
		::Dynamic openFileDialog_onComplete_dyn();

		void openFileDialog_onSelect(::String path);
		::Dynamic openFileDialog_onSelect_dyn();

		void saveFileDialog_onCancel();
		::Dynamic saveFileDialog_onCancel_dyn();

		void saveFileDialog_onSave(::String path);
		::Dynamic saveFileDialog_onSave_dyn();

		void saveFileDialog_onSelect(::String path);
		::Dynamic saveFileDialog_onSelect_dyn();

		void urlLoader_download_onComplete( ::openfl::events::Event event);
		::Dynamic urlLoader_download_onComplete_dyn();

		void urlLoader_upload_onHttpResponseStatus( ::openfl::events::HTTPStatusEvent event);
		::Dynamic urlLoader_upload_onHttpResponseStatus_dyn();

		void urlLoader_upload_onHttpStatus( ::openfl::events::HTTPStatusEvent event);
		::Dynamic urlLoader_upload_onHttpStatus_dyn();

		void urlLoader_upload_onComplete( ::openfl::events::Event event);
		::Dynamic urlLoader_upload_onComplete_dyn();

		void urlLoader_onIOError( ::openfl::events::IOErrorEvent event);
		::Dynamic urlLoader_onIOError_dyn();

		void urlLoader_onProgress( ::openfl::events::ProgressEvent event);
		::Dynamic urlLoader_onProgress_dyn();

		void urlLoader_onOpen( ::openfl::events::Event event);
		::Dynamic urlLoader_onOpen_dyn();

		virtual  ::Date get_creationDate();
		::Dynamic get_creationDate_dyn();

		virtual  ::Date get_modificationDate();
		::Dynamic get_modificationDate_dyn();

		virtual ::String get_name();
		::Dynamic get_name_dyn();

		virtual Float get_size();
		::Dynamic get_size_dyn();

		virtual ::String get_type();
		::Dynamic get_type_dyn();

		::String get_extension();
		::Dynamic get_extension_dyn();

};

} // end namespace openfl
} // end namespace net

#endif /* INCLUDED_openfl_net_FileReference */ 
