// Generated by Haxe 4.3.1
#include <hxcpp.h>

#ifndef INCLUDED_openfl_utils_IDataInput
#include <openfl/utils/IDataInput.h>
#endif
#ifndef INCLUDED_openfl_utils_IDataOutput
#include <openfl/utils/IDataOutput.h>
#endif
#ifndef INCLUDED_openfl_utils_IExternalizable
#include <openfl/utils/IExternalizable.h>
#endif

namespace openfl{
namespace utils{


static ::String IExternalizable_obj_sMemberFields[] = {
	HX_("readExternal",c1,8f,b8,1e),
	HX_("writeExternal",4a,e2,24,a7),
	::String(null()) };

::hx::Class IExternalizable_obj::__mClass;

void IExternalizable_obj::__register()
{
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("openfl.utils.IExternalizable",24,f1,82,c2);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(IExternalizable_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TIsInterface< (int)0x58114efe >;
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace openfl
} // end namespace utils
