// Generated by Haxe 4.3.1
#include <hxcpp.h>

#ifndef INCLUDED_openfl_geom__Orientation3D_Orientation3D_Impl_
#include <openfl/geom/_Orientation3D/Orientation3D_Impl_.h>
#endif

HX_LOCAL_STACK_FRAME(_hx_pos_dbfa7e5fc0c22ef6_63_fromString,"openfl.geom._Orientation3D.Orientation3D_Impl_","fromString",0xa47116a0,"openfl.geom._Orientation3D.Orientation3D_Impl_.fromString","openfl/geom/Orientation3D.hx",63,0xf4ac08f1)
HX_LOCAL_STACK_FRAME(_hx_pos_dbfa7e5fc0c22ef6_74_toString,"openfl.geom._Orientation3D.Orientation3D_Impl_","toString",0xf11d8e31,"openfl.geom._Orientation3D.Orientation3D_Impl_.toString","openfl/geom/Orientation3D.hx",74,0xf4ac08f1)
HX_LOCAL_STACK_FRAME(_hx_pos_dbfa7e5fc0c22ef6_31_boot,"openfl.geom._Orientation3D.Orientation3D_Impl_","boot",0xe951db37,"openfl.geom._Orientation3D.Orientation3D_Impl_.boot","openfl/geom/Orientation3D.hx",31,0xf4ac08f1)
HX_LOCAL_STACK_FRAME(_hx_pos_dbfa7e5fc0c22ef6_47_boot,"openfl.geom._Orientation3D.Orientation3D_Impl_","boot",0xe951db37,"openfl.geom._Orientation3D.Orientation3D_Impl_.boot","openfl/geom/Orientation3D.hx",47,0xf4ac08f1)
HX_LOCAL_STACK_FRAME(_hx_pos_dbfa7e5fc0c22ef6_59_boot,"openfl.geom._Orientation3D.Orientation3D_Impl_","boot",0xe951db37,"openfl.geom._Orientation3D.Orientation3D_Impl_.boot","openfl/geom/Orientation3D.hx",59,0xf4ac08f1)
namespace openfl{
namespace geom{
namespace _Orientation3D{

void Orientation3D_Impl__obj::__construct() { }

Dynamic Orientation3D_Impl__obj::__CreateEmpty() { return new Orientation3D_Impl__obj; }

void *Orientation3D_Impl__obj::_hx_vtable = 0;

Dynamic Orientation3D_Impl__obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< Orientation3D_Impl__obj > _hx_result = new Orientation3D_Impl__obj();
	_hx_result->__construct();
	return _hx_result;
}

bool Orientation3D_Impl__obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x786dfb4b;
}

 ::Dynamic Orientation3D_Impl__obj::AXIS_ANGLE;

 ::Dynamic Orientation3D_Impl__obj::EULER_ANGLES;

 ::Dynamic Orientation3D_Impl__obj::QUATERNION;

 ::Dynamic Orientation3D_Impl__obj::fromString(::String value){
            	HX_STACKFRAME(&_hx_pos_dbfa7e5fc0c22ef6_63_fromString)
HXDLIN(  63)		::String _hx_switch_0 = value;
            		if (  (_hx_switch_0==HX_("axisAngle",72,2f,86,7c)) ){
HXLINE(  65)			return 0;
HXDLIN(  65)			goto _hx_goto_0;
            		}
            		if (  (_hx_switch_0==HX_("eulerAngles",89,d7,c4,64)) ){
HXLINE(  66)			return 1;
HXDLIN(  66)			goto _hx_goto_0;
            		}
            		if (  (_hx_switch_0==HX_("quaternion",1e,0d,ca,1b)) ){
HXLINE(  67)			return 2;
HXDLIN(  67)			goto _hx_goto_0;
            		}
            		/* default */{
HXLINE(  68)			return null();
            		}
            		_hx_goto_0:;
HXLINE(  63)		return null();
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Orientation3D_Impl__obj,fromString,return )

::String Orientation3D_Impl__obj::toString( ::Dynamic this1){
            	HX_STACKFRAME(&_hx_pos_dbfa7e5fc0c22ef6_74_toString)
HXDLIN(  74)		 ::Dynamic _hx_switch_0 = this1;
            		if (  (_hx_switch_0==0) ){
HXLINE(  76)			return HX_("axisAngle",72,2f,86,7c);
HXDLIN(  76)			goto _hx_goto_2;
            		}
            		if (  (_hx_switch_0==1) ){
HXLINE(  77)			return HX_("eulerAngles",89,d7,c4,64);
HXDLIN(  77)			goto _hx_goto_2;
            		}
            		if (  (_hx_switch_0==2) ){
HXLINE(  78)			return HX_("quaternion",1e,0d,ca,1b);
HXDLIN(  78)			goto _hx_goto_2;
            		}
            		/* default */{
HXLINE(  79)			return null();
            		}
            		_hx_goto_2:;
HXLINE(  74)		return null();
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Orientation3D_Impl__obj,toString,return )


Orientation3D_Impl__obj::Orientation3D_Impl__obj()
{
}

bool Orientation3D_Impl__obj::__GetStatic(const ::String &inName, Dynamic &outValue, ::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 8:
		if (HX_FIELD_EQ(inName,"toString") ) { outValue = toString_dyn(); return true; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"fromString") ) { outValue = fromString_dyn(); return true; }
	}
	return false;
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo *Orientation3D_Impl__obj_sMemberStorageInfo = 0;
static ::hx::StaticInfo Orientation3D_Impl__obj_sStaticStorageInfo[] = {
	{::hx::fsObject /*  ::Dynamic */ ,(void *) &Orientation3D_Impl__obj::AXIS_ANGLE,HX_("AXIS_ANGLE",55,56,74,bd)},
	{::hx::fsObject /*  ::Dynamic */ ,(void *) &Orientation3D_Impl__obj::EULER_ANGLES,HX_("EULER_ANGLES",b6,6c,da,49)},
	{::hx::fsObject /*  ::Dynamic */ ,(void *) &Orientation3D_Impl__obj::QUATERNION,HX_("QUATERNION",1e,81,d3,0d)},
	{ ::hx::fsUnknown, 0, null()}
};
#endif

static void Orientation3D_Impl__obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Orientation3D_Impl__obj::AXIS_ANGLE,"AXIS_ANGLE");
	HX_MARK_MEMBER_NAME(Orientation3D_Impl__obj::EULER_ANGLES,"EULER_ANGLES");
	HX_MARK_MEMBER_NAME(Orientation3D_Impl__obj::QUATERNION,"QUATERNION");
};

#ifdef HXCPP_VISIT_ALLOCS
static void Orientation3D_Impl__obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Orientation3D_Impl__obj::AXIS_ANGLE,"AXIS_ANGLE");
	HX_VISIT_MEMBER_NAME(Orientation3D_Impl__obj::EULER_ANGLES,"EULER_ANGLES");
	HX_VISIT_MEMBER_NAME(Orientation3D_Impl__obj::QUATERNION,"QUATERNION");
};

#endif

::hx::Class Orientation3D_Impl__obj::__mClass;

static ::String Orientation3D_Impl__obj_sStaticFields[] = {
	HX_("AXIS_ANGLE",55,56,74,bd),
	HX_("EULER_ANGLES",b6,6c,da,49),
	HX_("QUATERNION",1e,81,d3,0d),
	HX_("fromString",db,2d,74,54),
	HX_("toString",ac,d0,6e,38),
	::String(null())
};

void Orientation3D_Impl__obj::__register()
{
	Orientation3D_Impl__obj _hx_dummy;
	Orientation3D_Impl__obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("openfl.geom._Orientation3D.Orientation3D_Impl_",89,67,e7,57);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &Orientation3D_Impl__obj::__GetStatic;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mMarkFunc = Orientation3D_Impl__obj_sMarkStatics;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(Orientation3D_Impl__obj_sStaticFields);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = ::hx::TCanCast< Orientation3D_Impl__obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = Orientation3D_Impl__obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = Orientation3D_Impl__obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = Orientation3D_Impl__obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

void Orientation3D_Impl__obj::__boot()
{
{
            	HX_STACKFRAME(&_hx_pos_dbfa7e5fc0c22ef6_31_boot)
HXDLIN(  31)		AXIS_ANGLE = 0;
            	}
{
            	HX_STACKFRAME(&_hx_pos_dbfa7e5fc0c22ef6_47_boot)
HXDLIN(  47)		EULER_ANGLES = 1;
            	}
{
            	HX_STACKFRAME(&_hx_pos_dbfa7e5fc0c22ef6_59_boot)
HXDLIN(  59)		QUATERNION = 2;
            	}
}

} // end namespace openfl
} // end namespace geom
} // end namespace _Orientation3D
