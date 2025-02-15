// Generated by Haxe 4.3.1
#include <hxcpp.h>

#ifndef INCLUDED_openfl_media_ID3Info
#include <openfl/media/ID3Info.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_93e4eccf60244a3a_51_new,"openfl.media.ID3Info","new",0xc3c5ad90,"openfl.media.ID3Info.new","openfl/media/ID3Info.hx",51,0xcebe7122)
namespace openfl{
namespace media{

void ID3Info_obj::__construct(){
            	HX_STACKFRAME(&_hx_pos_93e4eccf60244a3a_51_new)
            	}

Dynamic ID3Info_obj::__CreateEmpty() { return new ID3Info_obj; }

void *ID3Info_obj::_hx_vtable = 0;

Dynamic ID3Info_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< ID3Info_obj > _hx_result = new ID3Info_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool ID3Info_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x1ff899d6;
}


ID3Info_obj::ID3Info_obj()
{
}

void ID3Info_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(ID3Info);
	HX_MARK_MEMBER_NAME(album,"album");
	HX_MARK_MEMBER_NAME(artist,"artist");
	HX_MARK_MEMBER_NAME(comment,"comment");
	HX_MARK_MEMBER_NAME(genre,"genre");
	HX_MARK_MEMBER_NAME(songName,"songName");
	HX_MARK_MEMBER_NAME(track,"track");
	HX_MARK_MEMBER_NAME(year,"year");
	HX_MARK_END_CLASS();
}

void ID3Info_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(album,"album");
	HX_VISIT_MEMBER_NAME(artist,"artist");
	HX_VISIT_MEMBER_NAME(comment,"comment");
	HX_VISIT_MEMBER_NAME(genre,"genre");
	HX_VISIT_MEMBER_NAME(songName,"songName");
	HX_VISIT_MEMBER_NAME(track,"track");
	HX_VISIT_MEMBER_NAME(year,"year");
}

::hx::Val ID3Info_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"year") ) { return ::hx::Val( year ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"album") ) { return ::hx::Val( album ); }
		if (HX_FIELD_EQ(inName,"genre") ) { return ::hx::Val( genre ); }
		if (HX_FIELD_EQ(inName,"track") ) { return ::hx::Val( track ); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"artist") ) { return ::hx::Val( artist ); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"comment") ) { return ::hx::Val( comment ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"songName") ) { return ::hx::Val( songName ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val ID3Info_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"year") ) { year=inValue.Cast< ::String >(); return inValue; }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"album") ) { album=inValue.Cast< ::String >(); return inValue; }
		if (HX_FIELD_EQ(inName,"genre") ) { genre=inValue.Cast< ::String >(); return inValue; }
		if (HX_FIELD_EQ(inName,"track") ) { track=inValue.Cast< ::String >(); return inValue; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"artist") ) { artist=inValue.Cast< ::String >(); return inValue; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"comment") ) { comment=inValue.Cast< ::String >(); return inValue; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"songName") ) { songName=inValue.Cast< ::String >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void ID3Info_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("album",2f,13,8c,21));
	outFields->push(HX_("artist",c7,f2,48,b9));
	outFields->push(HX_("comment",5f,7a,70,81));
	outFields->push(HX_("genre",43,28,5c,91));
	outFields->push(HX_("songName",c0,d0,d7,36));
	outFields->push(HX_("track",8b,8e,1f,16));
	outFields->push(HX_("year",bd,c9,47,50));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo ID3Info_obj_sMemberStorageInfo[] = {
	{::hx::fsString,(int)offsetof(ID3Info_obj,album),HX_("album",2f,13,8c,21)},
	{::hx::fsString,(int)offsetof(ID3Info_obj,artist),HX_("artist",c7,f2,48,b9)},
	{::hx::fsString,(int)offsetof(ID3Info_obj,comment),HX_("comment",5f,7a,70,81)},
	{::hx::fsString,(int)offsetof(ID3Info_obj,genre),HX_("genre",43,28,5c,91)},
	{::hx::fsString,(int)offsetof(ID3Info_obj,songName),HX_("songName",c0,d0,d7,36)},
	{::hx::fsString,(int)offsetof(ID3Info_obj,track),HX_("track",8b,8e,1f,16)},
	{::hx::fsString,(int)offsetof(ID3Info_obj,year),HX_("year",bd,c9,47,50)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo *ID3Info_obj_sStaticStorageInfo = 0;
#endif

static ::String ID3Info_obj_sMemberFields[] = {
	HX_("album",2f,13,8c,21),
	HX_("artist",c7,f2,48,b9),
	HX_("comment",5f,7a,70,81),
	HX_("genre",43,28,5c,91),
	HX_("songName",c0,d0,d7,36),
	HX_("track",8b,8e,1f,16),
	HX_("year",bd,c9,47,50),
	::String(null()) };

::hx::Class ID3Info_obj::__mClass;

void ID3Info_obj::__register()
{
	ID3Info_obj _hx_dummy;
	ID3Info_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("openfl.media.ID3Info",9e,e5,63,fb);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(ID3Info_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< ID3Info_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = ID3Info_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = ID3Info_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace openfl
} // end namespace media
