// Generated by Haxe 4.3.1
#include <hxcpp.h>

#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_haxe_io_Bytes
#include <haxe/io/Bytes.h>
#endif
#ifndef INCLUDED_lime__internal_backend_native_NativeOpenGLRenderContext
#include <lime/_internal/backend/native/NativeOpenGLRenderContext.h>
#endif
#ifndef INCLUDED_lime_graphics_Image
#include <lime/graphics/Image.h>
#endif
#ifndef INCLUDED_lime_graphics__WebGL2RenderContext_WebGL2RenderContext_Impl_
#include <lime/graphics/_WebGL2RenderContext/WebGL2RenderContext_Impl_.h>
#endif
#ifndef INCLUDED_lime_graphics_opengl_GLObject
#include <lime/graphics/opengl/GLObject.h>
#endif
#ifndef INCLUDED_lime_utils_ArrayBufferView
#include <lime/utils/ArrayBufferView.h>
#endif
#ifndef INCLUDED_lime_utils_BytePointerData
#include <lime/utils/BytePointerData.h>
#endif
#ifndef INCLUDED_lime_utils_TAError
#include <lime/utils/TAError.h>
#endif
#ifndef INCLUDED_lime_utils__BytePointer_BytePointer_Impl_
#include <lime/utils/_BytePointer/BytePointer_Impl_.h>
#endif
#ifndef INCLUDED_lime_utils__DataPointer_DataPointer_Impl_
#include <lime/utils/_DataPointer/DataPointer_Impl_.h>
#endif
#ifndef INCLUDED_openfl__Vector_IVector
#include <openfl/_Vector/IVector.h>
#endif
#ifndef INCLUDED_openfl__Vector_IntVector
#include <openfl/_Vector/IntVector.h>
#endif
#ifndef INCLUDED_openfl_display_BitmapData
#include <openfl/display/BitmapData.h>
#endif
#ifndef INCLUDED_openfl_display_IBitmapDrawable
#include <openfl/display/IBitmapDrawable.h>
#endif
#ifndef INCLUDED_openfl_display__internal_SamplerState
#include <openfl/display/_internal/SamplerState.h>
#endif
#ifndef INCLUDED_openfl_display3D_Context3D
#include <openfl/display3D/Context3D.h>
#endif
#ifndef INCLUDED_openfl_display3D_textures_RectangleTexture
#include <openfl/display3D/textures/RectangleTexture.h>
#endif
#ifndef INCLUDED_openfl_display3D_textures_TextureBase
#include <openfl/display3D/textures/TextureBase.h>
#endif
#ifndef INCLUDED_openfl_events_EventDispatcher
#include <openfl/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_openfl_events_IEventDispatcher
#include <openfl/events/IEventDispatcher.h>
#endif
#ifndef INCLUDED_openfl_utils_ByteArrayData
#include <openfl/utils/ByteArrayData.h>
#endif
#ifndef INCLUDED_openfl_utils_IDataInput
#include <openfl/utils/IDataInput.h>
#endif
#ifndef INCLUDED_openfl_utils_IDataOutput
#include <openfl/utils/IDataOutput.h>
#endif
#ifndef INCLUDED_openfl_utils__ByteArray_ByteArray_Impl_
#include <openfl/utils/_ByteArray/ByteArray_Impl_.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_574e9a3948a11606_28_new,"openfl.display3D.textures.RectangleTexture","new",0xcccbdd5b,"openfl.display3D.textures.RectangleTexture.new","openfl/display3D/textures/RectangleTexture.hx",28,0x83565556)
HX_LOCAL_STACK_FRAME(_hx_pos_574e9a3948a11606_53_uploadFromBitmapData,"openfl.display3D.textures.RectangleTexture","uploadFromBitmapData",0x711b2e49,"openfl.display3D.textures.RectangleTexture.uploadFromBitmapData","openfl/display3D/textures/RectangleTexture.hx",53,0x83565556)
HX_LOCAL_STACK_FRAME(_hx_pos_574e9a3948a11606_103_uploadFromByteArray,"openfl.display3D.textures.RectangleTexture","uploadFromByteArray",0xfd7a0ae1,"openfl.display3D.textures.RectangleTexture.uploadFromByteArray","openfl/display3D/textures/RectangleTexture.hx",103,0x83565556)
HX_LOCAL_STACK_FRAME(_hx_pos_574e9a3948a11606_115_uploadFromTypedArray,"openfl.display3D.textures.RectangleTexture","uploadFromTypedArray",0x35aa255f,"openfl.display3D.textures.RectangleTexture.uploadFromTypedArray","openfl/display3D/textures/RectangleTexture.hx",115,0x83565556)
HX_LOCAL_STACK_FRAME(_hx_pos_574e9a3948a11606_124___setSamplerState,"openfl.display3D.textures.RectangleTexture","__setSamplerState",0xea7a95c6,"openfl.display3D.textures.RectangleTexture.__setSamplerState","openfl/display3D/textures/RectangleTexture.hx",124,0x83565556)
namespace openfl{
namespace display3D{
namespace textures{

void RectangleTexture_obj::__construct( ::openfl::display3D::Context3D context,int width,int height,::String format,bool optimizeForRenderToTexture){
            	HX_STACKFRAME(&_hx_pos_574e9a3948a11606_28_new)
HXLINE(  29)		super::__construct(context);
HXLINE(  31)		this->_hx___width = width;
HXLINE(  32)		this->_hx___height = height;
HXLINE(  34)		this->_hx___optimizeForRenderToTexture = optimizeForRenderToTexture;
HXLINE(  36)		this->_hx___textureTarget = this->_hx___context->gl->TEXTURE_2D;
HXLINE(  37)		this->uploadFromTypedArray(null());
HXLINE(  39)		if (optimizeForRenderToTexture) {
HXLINE(  39)			this->_hx___getGLFramebuffer(true,0,0);
            		}
            	}

Dynamic RectangleTexture_obj::__CreateEmpty() { return new RectangleTexture_obj; }

void *RectangleTexture_obj::_hx_vtable = 0;

Dynamic RectangleTexture_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< RectangleTexture_obj > _hx_result = new RectangleTexture_obj();
	_hx_result->__construct(inArgs[0],inArgs[1],inArgs[2],inArgs[3],inArgs[4]);
	return _hx_result;
}

bool RectangleTexture_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x0c89e854) {
		if (inClassId<=(int)0x0621e2cf) {
			return inClassId==(int)0x00000001 || inClassId==(int)0x0621e2cf;
		} else {
			return inClassId==(int)0x0c89e854;
		}
	} else {
		return inClassId==(int)0x3247d979;
	}
}

void RectangleTexture_obj::uploadFromBitmapData( ::openfl::display::BitmapData source){
            	HX_STACKFRAME(&_hx_pos_574e9a3948a11606_53_uploadFromBitmapData)
HXLINE(  55)		if (::hx::IsNull( source )) {
HXLINE(  55)			return;
            		}
HXLINE(  57)		 ::lime::graphics::Image image = this->_hx___getImage(source);
HXLINE(  58)		if (::hx::IsNull( image )) {
HXLINE(  58)			return;
            		}
HXLINE(  72)		this->uploadFromTypedArray(image->get_data());
            	}


HX_DEFINE_DYNAMIC_FUNC1(RectangleTexture_obj,uploadFromBitmapData,(void))

void RectangleTexture_obj::uploadFromByteArray( ::openfl::utils::ByteArrayData data,int byteArrayOffset){
            	HX_GC_STACKFRAME(&_hx_pos_574e9a3948a11606_103_uploadFromByteArray)
HXDLIN( 103)		 ::Dynamic elements = null();
HXDLIN( 103)		 ::haxe::io::Bytes buffer = ::openfl::utils::_ByteArray::ByteArray_Impl__obj::toArrayBuffer(data);
HXDLIN( 103)		::cpp::VirtualArray array = null();
HXDLIN( 103)		 ::openfl::_Vector::IntVector vector = null();
HXDLIN( 103)		 ::lime::utils::ArrayBufferView view = null();
HXDLIN( 103)		 ::Dynamic byteoffset = byteArrayOffset;
HXDLIN( 103)		 ::Dynamic len = null();
HXDLIN( 103)		if (::hx::IsNull( byteoffset )) {
HXDLIN( 103)			byteoffset = 0;
            		}
HXDLIN( 103)		 ::lime::utils::ArrayBufferView this1;
HXDLIN( 103)		if (::hx::IsNotNull( elements )) {
HXDLIN( 103)			this1 =  ::lime::utils::ArrayBufferView_obj::__alloc( HX_CTX ,elements,4);
            		}
            		else {
HXDLIN( 103)			if (::hx::IsNotNull( array )) {
HXDLIN( 103)				 ::lime::utils::ArrayBufferView _this =  ::lime::utils::ArrayBufferView_obj::__alloc( HX_CTX ,0,4);
HXDLIN( 103)				_this->byteOffset = 0;
HXDLIN( 103)				_this->length = array->get_length();
HXDLIN( 103)				_this->byteLength = (_this->length * _this->bytesPerElement);
HXDLIN( 103)				_this->buffer = ::haxe::io::Bytes_obj::alloc(_this->byteLength);
HXDLIN( 103)				_this->copyFromArray(array,null());
HXDLIN( 103)				this1 = _this;
            			}
            			else {
HXDLIN( 103)				if (::hx::IsNotNull( vector )) {
HXDLIN( 103)					 ::lime::utils::ArrayBufferView _this1 =  ::lime::utils::ArrayBufferView_obj::__alloc( HX_CTX ,0,4);
HXDLIN( 103)					::cpp::VirtualArray array1 = ( (::cpp::VirtualArray)(vector->__Field(HX_("__array",79,c6,ed,8f),::hx::paccDynamic)) );
HXDLIN( 103)					_this1->byteOffset = 0;
HXDLIN( 103)					_this1->length = array1->get_length();
HXDLIN( 103)					_this1->byteLength = (_this1->length * _this1->bytesPerElement);
HXDLIN( 103)					_this1->buffer = ::haxe::io::Bytes_obj::alloc(_this1->byteLength);
HXDLIN( 103)					_this1->copyFromArray(array1,null());
HXDLIN( 103)					this1 = _this1;
            				}
            				else {
HXDLIN( 103)					if (::hx::IsNotNull( view )) {
HXDLIN( 103)						 ::lime::utils::ArrayBufferView _this2 =  ::lime::utils::ArrayBufferView_obj::__alloc( HX_CTX ,0,4);
HXDLIN( 103)						 ::haxe::io::Bytes srcData = view->buffer;
HXDLIN( 103)						int srcLength = view->length;
HXDLIN( 103)						int srcByteOffset = view->byteOffset;
HXDLIN( 103)						int srcElementSize = view->bytesPerElement;
HXDLIN( 103)						int elementSize = _this2->bytesPerElement;
HXDLIN( 103)						if ((view->type == _this2->type)) {
HXDLIN( 103)							int srcLength1 = srcData->length;
HXDLIN( 103)							int cloneLength = (srcLength1 - srcByteOffset);
HXDLIN( 103)							_this2->buffer = ::haxe::io::Bytes_obj::alloc(cloneLength);
HXDLIN( 103)							_this2->buffer->blit(0,srcData,srcByteOffset,cloneLength);
            						}
            						else {
HXDLIN( 103)							HX_STACK_DO_THROW(HX_("unimplemented",09,2f,74,b4));
            						}
HXDLIN( 103)						_this2->byteLength = (_this2->bytesPerElement * srcLength);
HXDLIN( 103)						_this2->byteOffset = 0;
HXDLIN( 103)						_this2->length = srcLength;
HXDLIN( 103)						this1 = _this2;
            					}
            					else {
HXDLIN( 103)						if (::hx::IsNotNull( buffer )) {
HXDLIN( 103)							 ::lime::utils::ArrayBufferView _this3 =  ::lime::utils::ArrayBufferView_obj::__alloc( HX_CTX ,0,4);
HXDLIN( 103)							int in_byteOffset = ( (int)(byteoffset) );
HXDLIN( 103)							if ((in_byteOffset < 0)) {
HXDLIN( 103)								HX_STACK_DO_THROW(::lime::utils::TAError_obj::RangeError_dyn());
            							}
HXDLIN( 103)							if ((::hx::Mod(in_byteOffset,_this3->bytesPerElement) != 0)) {
HXDLIN( 103)								HX_STACK_DO_THROW(::lime::utils::TAError_obj::RangeError_dyn());
            							}
HXDLIN( 103)							int bufferByteLength = buffer->length;
HXDLIN( 103)							int elementSize1 = _this3->bytesPerElement;
HXDLIN( 103)							int newByteLength = bufferByteLength;
HXDLIN( 103)							if (::hx::IsNull( len )) {
HXDLIN( 103)								newByteLength = (bufferByteLength - in_byteOffset);
HXDLIN( 103)								if ((::hx::Mod(bufferByteLength,_this3->bytesPerElement) != 0)) {
HXDLIN( 103)									HX_STACK_DO_THROW(::lime::utils::TAError_obj::RangeError_dyn());
            								}
HXDLIN( 103)								if ((newByteLength < 0)) {
HXDLIN( 103)									HX_STACK_DO_THROW(::lime::utils::TAError_obj::RangeError_dyn());
            								}
            							}
            							else {
HXDLIN( 103)								newByteLength = (( (int)(len) ) * _this3->bytesPerElement);
HXDLIN( 103)								int newRange = (in_byteOffset + newByteLength);
HXDLIN( 103)								if ((newRange > bufferByteLength)) {
HXDLIN( 103)									HX_STACK_DO_THROW(::lime::utils::TAError_obj::RangeError_dyn());
            								}
            							}
HXDLIN( 103)							_this3->buffer = buffer;
HXDLIN( 103)							_this3->byteOffset = in_byteOffset;
HXDLIN( 103)							_this3->byteLength = newByteLength;
HXDLIN( 103)							_this3->length = ::Std_obj::_hx_int((( (Float)(newByteLength) ) / ( (Float)(_this3->bytesPerElement) )));
HXDLIN( 103)							this1 = _this3;
            						}
            						else {
HXDLIN( 103)							HX_STACK_DO_THROW(HX_("Invalid constructor arguments for UInt8Array",6b,44,d5,85));
            						}
            					}
            				}
            			}
            		}
HXDLIN( 103)		this->uploadFromTypedArray(this1);
            	}


HX_DEFINE_DYNAMIC_FUNC2(RectangleTexture_obj,uploadFromByteArray,(void))

void RectangleTexture_obj::uploadFromTypedArray( ::lime::utils::ArrayBufferView data){
            	HX_STACKFRAME(&_hx_pos_574e9a3948a11606_115_uploadFromTypedArray)
HXLINE( 116)		 ::lime::_internal::backend::native::NativeOpenGLRenderContext gl = this->_hx___context->gl;
HXLINE( 118)		this->_hx___context->_hx___bindGLTexture2D(this->_hx___textureID);
HXLINE( 119)		{
HXLINE( 119)			int target = this->_hx___textureTarget;
HXDLIN( 119)			int internalformat = this->_hx___internalFormat;
HXDLIN( 119)			int width = this->_hx___width;
HXDLIN( 119)			int height = this->_hx___height;
HXDLIN( 119)			int format = this->_hx___format;
HXDLIN( 119)			int type = gl->UNSIGNED_BYTE;
HXDLIN( 119)			{
HXLINE( 119)				::lime::utils::_BytePointer::BytePointer_Impl__obj::set(::lime::graphics::_WebGL2RenderContext::WebGL2RenderContext_Impl__obj::_hx___tempPointer,null(),data,null(),0);
HXDLIN( 119)				gl->texImage2D(target,0,internalformat,width,height,0,format,type,::lime::utils::_DataPointer::DataPointer_Impl__obj::fromBytesPointer(::lime::graphics::_WebGL2RenderContext::WebGL2RenderContext_Impl__obj::_hx___tempPointer));
            			}
            		}
HXLINE( 120)		this->_hx___context->_hx___bindGLTexture2D(null());
            	}


HX_DEFINE_DYNAMIC_FUNC1(RectangleTexture_obj,uploadFromTypedArray,(void))

bool RectangleTexture_obj::_hx___setSamplerState( ::openfl::display::_internal::SamplerState state){
            	HX_STACKFRAME(&_hx_pos_574e9a3948a11606_124___setSamplerState)
HXLINE( 125)		if (this->super::_hx___setSamplerState(state)) {
HXLINE( 127)			 ::lime::_internal::backend::native::NativeOpenGLRenderContext gl = this->_hx___context->gl;
HXLINE( 129)			if ((::openfl::display3D::Context3D_obj::_hx___glMaxTextureMaxAnisotropy != 0)) {
HXLINE( 131)				int aniso;
HXDLIN( 131)				 ::Dynamic _hx_switch_0 = state->filter;
            				if (  (_hx_switch_0==0) ){
HXLINE( 131)					aniso = 16;
HXDLIN( 131)					goto _hx_goto_4;
            				}
            				if (  (_hx_switch_0==1) ){
HXLINE( 131)					aniso = 2;
HXDLIN( 131)					goto _hx_goto_4;
            				}
            				if (  (_hx_switch_0==2) ){
HXLINE( 131)					aniso = 4;
HXDLIN( 131)					goto _hx_goto_4;
            				}
            				if (  (_hx_switch_0==3) ){
HXLINE( 131)					aniso = 8;
HXDLIN( 131)					goto _hx_goto_4;
            				}
            				/* default */{
HXLINE( 131)					aniso = 1;
            				}
            				_hx_goto_4:;
HXLINE( 140)				if ((aniso > ::openfl::display3D::Context3D_obj::_hx___glMaxTextureMaxAnisotropy)) {
HXLINE( 142)					aniso = ::openfl::display3D::Context3D_obj::_hx___glMaxTextureMaxAnisotropy;
            				}
HXLINE( 145)				gl->texParameterf(gl->TEXTURE_2D,::openfl::display3D::Context3D_obj::_hx___glTextureMaxAnisotropy,( (Float)(aniso) ));
            			}
HXLINE( 148)			return true;
            		}
HXLINE( 151)		return false;
            	}



::hx::ObjectPtr< RectangleTexture_obj > RectangleTexture_obj::__new( ::openfl::display3D::Context3D context,int width,int height,::String format,bool optimizeForRenderToTexture) {
	::hx::ObjectPtr< RectangleTexture_obj > __this = new RectangleTexture_obj();
	__this->__construct(context,width,height,format,optimizeForRenderToTexture);
	return __this;
}

::hx::ObjectPtr< RectangleTexture_obj > RectangleTexture_obj::__alloc(::hx::Ctx *_hx_ctx, ::openfl::display3D::Context3D context,int width,int height,::String format,bool optimizeForRenderToTexture) {
	RectangleTexture_obj *__this = (RectangleTexture_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(RectangleTexture_obj), true, "openfl.display3D.textures.RectangleTexture"));
	*(void **)__this = RectangleTexture_obj::_hx_vtable;
	__this->__construct(context,width,height,format,optimizeForRenderToTexture);
	return __this;
}

RectangleTexture_obj::RectangleTexture_obj()
{
}

::hx::Val RectangleTexture_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 17:
		if (HX_FIELD_EQ(inName,"__setSamplerState") ) { return ::hx::Val( _hx___setSamplerState_dyn() ); }
		break;
	case 19:
		if (HX_FIELD_EQ(inName,"uploadFromByteArray") ) { return ::hx::Val( uploadFromByteArray_dyn() ); }
		break;
	case 20:
		if (HX_FIELD_EQ(inName,"uploadFromBitmapData") ) { return ::hx::Val( uploadFromBitmapData_dyn() ); }
		if (HX_FIELD_EQ(inName,"uploadFromTypedArray") ) { return ::hx::Val( uploadFromTypedArray_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo *RectangleTexture_obj_sMemberStorageInfo = 0;
static ::hx::StaticInfo *RectangleTexture_obj_sStaticStorageInfo = 0;
#endif

static ::String RectangleTexture_obj_sMemberFields[] = {
	HX_("uploadFromBitmapData",a4,85,65,0d),
	HX_("uploadFromByteArray",e6,17,1b,ee),
	HX_("uploadFromTypedArray",ba,7c,f4,d1),
	HX_("__setSamplerState",8b,e7,cf,5d),
	::String(null()) };

::hx::Class RectangleTexture_obj::__mClass;

void RectangleTexture_obj::__register()
{
	RectangleTexture_obj _hx_dummy;
	RectangleTexture_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("openfl.display3D.textures.RectangleTexture",e9,93,ed,a3);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(RectangleTexture_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< RectangleTexture_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = RectangleTexture_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = RectangleTexture_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace openfl
} // end namespace display3D
} // end namespace textures
