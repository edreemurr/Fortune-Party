// Generated by Haxe 4.3.1
#include <hxcpp.h>

#ifndef INCLUDED_openfl_display__internal_DrawCommandBuffer
#include <openfl/display/_internal/DrawCommandBuffer.h>
#endif
#ifndef INCLUDED_openfl_display__internal_DrawCommandReader
#include <openfl/display/_internal/DrawCommandReader.h>
#endif
#ifndef INCLUDED_openfl_display__internal__DrawCommandReader_LineGradientStyleView_Impl_
#include <openfl/display/_internal/_DrawCommandReader/LineGradientStyleView_Impl_.h>
#endif
#ifndef INCLUDED_openfl_geom_Matrix
#include <openfl/geom/Matrix.h>
#endif

HX_LOCAL_STACK_FRAME(_hx_pos_af20266d2b2be92c_817__new,"openfl.display._internal._DrawCommandReader.LineGradientStyleView_Impl_","_new",0x481bcd44,"openfl.display._internal._DrawCommandReader.LineGradientStyleView_Impl_._new","openfl/display/_internal/DrawCommandReader.hx",817,0x29f77eb3)
HX_LOCAL_STACK_FRAME(_hx_pos_af20266d2b2be92c_826_get_type,"openfl.display._internal._DrawCommandReader.LineGradientStyleView_Impl_","get_type",0x0bdd93a6,"openfl.display._internal._DrawCommandReader.LineGradientStyleView_Impl_.get_type","openfl/display/_internal/DrawCommandReader.hx",826,0x29f77eb3)
HX_LOCAL_STACK_FRAME(_hx_pos_af20266d2b2be92c_833_get_colors,"openfl.display._internal._DrawCommandReader.LineGradientStyleView_Impl_","get_colors",0x5c76799c,"openfl.display._internal._DrawCommandReader.LineGradientStyleView_Impl_.get_colors","openfl/display/_internal/DrawCommandReader.hx",833,0x29f77eb3)
HX_LOCAL_STACK_FRAME(_hx_pos_af20266d2b2be92c_840_get_alphas,"openfl.display._internal._DrawCommandReader.LineGradientStyleView_Impl_","get_alphas",0xd82b7f41,"openfl.display._internal._DrawCommandReader.LineGradientStyleView_Impl_.get_alphas","openfl/display/_internal/DrawCommandReader.hx",840,0x29f77eb3)
HX_LOCAL_STACK_FRAME(_hx_pos_af20266d2b2be92c_847_get_ratios,"openfl.display._internal._DrawCommandReader.LineGradientStyleView_Impl_","get_ratios",0x5179e8f4,"openfl.display._internal._DrawCommandReader.LineGradientStyleView_Impl_.get_ratios","openfl/display/_internal/DrawCommandReader.hx",847,0x29f77eb3)
HX_LOCAL_STACK_FRAME(_hx_pos_af20266d2b2be92c_854_get_matrix,"openfl.display._internal._DrawCommandReader.LineGradientStyleView_Impl_","get_matrix",0x51b7ea2d,"openfl.display._internal._DrawCommandReader.LineGradientStyleView_Impl_.get_matrix","openfl/display/_internal/DrawCommandReader.hx",854,0x29f77eb3)
HX_LOCAL_STACK_FRAME(_hx_pos_af20266d2b2be92c_861_get_spreadMethod,"openfl.display._internal._DrawCommandReader.LineGradientStyleView_Impl_","get_spreadMethod",0xf82572a0,"openfl.display._internal._DrawCommandReader.LineGradientStyleView_Impl_.get_spreadMethod","openfl/display/_internal/DrawCommandReader.hx",861,0x29f77eb3)
HX_LOCAL_STACK_FRAME(_hx_pos_af20266d2b2be92c_868_get_interpolationMethod,"openfl.display._internal._DrawCommandReader.LineGradientStyleView_Impl_","get_interpolationMethod",0x92b9d7b9,"openfl.display._internal._DrawCommandReader.LineGradientStyleView_Impl_.get_interpolationMethod","openfl/display/_internal/DrawCommandReader.hx",868,0x29f77eb3)
HX_LOCAL_STACK_FRAME(_hx_pos_af20266d2b2be92c_875_get_focalPointRatio,"openfl.display._internal._DrawCommandReader.LineGradientStyleView_Impl_","get_focalPointRatio",0xcb72dff4,"openfl.display._internal._DrawCommandReader.LineGradientStyleView_Impl_.get_focalPointRatio","openfl/display/_internal/DrawCommandReader.hx",875,0x29f77eb3)
namespace openfl{
namespace display{
namespace _internal{
namespace _DrawCommandReader{

void LineGradientStyleView_Impl__obj::__construct() { }

Dynamic LineGradientStyleView_Impl__obj::__CreateEmpty() { return new LineGradientStyleView_Impl__obj; }

void *LineGradientStyleView_Impl__obj::_hx_vtable = 0;

Dynamic LineGradientStyleView_Impl__obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< LineGradientStyleView_Impl__obj > _hx_result = new LineGradientStyleView_Impl__obj();
	_hx_result->__construct();
	return _hx_result;
}

bool LineGradientStyleView_Impl__obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x78ddb58d;
}

 ::openfl::display::_internal::DrawCommandReader LineGradientStyleView_Impl__obj::_new( ::openfl::display::_internal::DrawCommandReader d){
            	HX_STACKFRAME(&_hx_pos_af20266d2b2be92c_817__new)
HXDLIN( 817)		return d;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(LineGradientStyleView_Impl__obj,_new,return )

 ::Dynamic LineGradientStyleView_Impl__obj::get_type( ::openfl::display::_internal::DrawCommandReader this1){
            	HX_STACKFRAME(&_hx_pos_af20266d2b2be92c_826_get_type)
HXDLIN( 826)		return this1->buffer->o->__get(this1->oPos);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(LineGradientStyleView_Impl__obj,get_type,return )

::Array< int > LineGradientStyleView_Impl__obj::get_colors( ::openfl::display::_internal::DrawCommandReader this1){
            	HX_STACKFRAME(&_hx_pos_af20266d2b2be92c_833_get_colors)
HXDLIN( 833)		return this1->buffer->ii->__get(this1->iiPos).StaticCast< ::Array< int > >();
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(LineGradientStyleView_Impl__obj,get_colors,return )

::Array< Float > LineGradientStyleView_Impl__obj::get_alphas( ::openfl::display::_internal::DrawCommandReader this1){
            	HX_STACKFRAME(&_hx_pos_af20266d2b2be92c_840_get_alphas)
HXDLIN( 840)		return this1->buffer->ff->__get(this1->ffPos).StaticCast< ::Array< Float > >();
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(LineGradientStyleView_Impl__obj,get_alphas,return )

::Array< int > LineGradientStyleView_Impl__obj::get_ratios( ::openfl::display::_internal::DrawCommandReader this1){
            	HX_STACKFRAME(&_hx_pos_af20266d2b2be92c_847_get_ratios)
HXDLIN( 847)		return this1->buffer->ii->__get((this1->iiPos + 1)).StaticCast< ::Array< int > >();
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(LineGradientStyleView_Impl__obj,get_ratios,return )

 ::openfl::geom::Matrix LineGradientStyleView_Impl__obj::get_matrix( ::openfl::display::_internal::DrawCommandReader this1){
            	HX_STACKFRAME(&_hx_pos_af20266d2b2be92c_854_get_matrix)
HXDLIN( 854)		return ( ( ::openfl::geom::Matrix)(this1->buffer->o->__get((this1->oPos + 1))) );
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(LineGradientStyleView_Impl__obj,get_matrix,return )

 ::Dynamic LineGradientStyleView_Impl__obj::get_spreadMethod( ::openfl::display::_internal::DrawCommandReader this1){
            	HX_STACKFRAME(&_hx_pos_af20266d2b2be92c_861_get_spreadMethod)
HXDLIN( 861)		return this1->buffer->o->__get((this1->oPos + 2));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(LineGradientStyleView_Impl__obj,get_spreadMethod,return )

 ::Dynamic LineGradientStyleView_Impl__obj::get_interpolationMethod( ::openfl::display::_internal::DrawCommandReader this1){
            	HX_STACKFRAME(&_hx_pos_af20266d2b2be92c_868_get_interpolationMethod)
HXDLIN( 868)		return this1->buffer->o->__get((this1->oPos + 3));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(LineGradientStyleView_Impl__obj,get_interpolationMethod,return )

Float LineGradientStyleView_Impl__obj::get_focalPointRatio( ::openfl::display::_internal::DrawCommandReader this1){
            	HX_STACKFRAME(&_hx_pos_af20266d2b2be92c_875_get_focalPointRatio)
HXDLIN( 875)		return this1->buffer->f->__get(this1->fPos);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(LineGradientStyleView_Impl__obj,get_focalPointRatio,return )


LineGradientStyleView_Impl__obj::LineGradientStyleView_Impl__obj()
{
}

bool LineGradientStyleView_Impl__obj::__GetStatic(const ::String &inName, Dynamic &outValue, ::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"_new") ) { outValue = _new_dyn(); return true; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"get_type") ) { outValue = get_type_dyn(); return true; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"get_colors") ) { outValue = get_colors_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"get_alphas") ) { outValue = get_alphas_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"get_ratios") ) { outValue = get_ratios_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"get_matrix") ) { outValue = get_matrix_dyn(); return true; }
		break;
	case 16:
		if (HX_FIELD_EQ(inName,"get_spreadMethod") ) { outValue = get_spreadMethod_dyn(); return true; }
		break;
	case 19:
		if (HX_FIELD_EQ(inName,"get_focalPointRatio") ) { outValue = get_focalPointRatio_dyn(); return true; }
		break;
	case 23:
		if (HX_FIELD_EQ(inName,"get_interpolationMethod") ) { outValue = get_interpolationMethod_dyn(); return true; }
	}
	return false;
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo *LineGradientStyleView_Impl__obj_sMemberStorageInfo = 0;
static ::hx::StaticInfo *LineGradientStyleView_Impl__obj_sStaticStorageInfo = 0;
#endif

::hx::Class LineGradientStyleView_Impl__obj::__mClass;

static ::String LineGradientStyleView_Impl__obj_sStaticFields[] = {
	HX_("_new",61,15,1f,3f),
	HX_("get_type",43,ae,c3,cc),
	HX_("get_colors",79,35,0e,b7),
	HX_("get_alphas",1e,3b,c3,32),
	HX_("get_ratios",d1,a4,11,ac),
	HX_("get_matrix",0a,a6,4f,ac),
	HX_("get_spreadMethod",3d,f2,c2,f1),
	HX_("get_interpolationMethod",bc,35,4a,d1),
	HX_("get_focalPointRatio",77,40,d5,4b),
	::String(null())
};

void LineGradientStyleView_Impl__obj::__register()
{
	LineGradientStyleView_Impl__obj _hx_dummy;
	LineGradientStyleView_Impl__obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("openfl.display._internal._DrawCommandReader.LineGradientStyleView_Impl_",6b,b3,38,12);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &LineGradientStyleView_Impl__obj::__GetStatic;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(LineGradientStyleView_Impl__obj_sStaticFields);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = ::hx::TCanCast< LineGradientStyleView_Impl__obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = LineGradientStyleView_Impl__obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = LineGradientStyleView_Impl__obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace openfl
} // end namespace display
} // end namespace _internal
} // end namespace _DrawCommandReader
