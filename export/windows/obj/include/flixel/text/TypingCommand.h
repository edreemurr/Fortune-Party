// Generated by Haxe 4.3.1
#ifndef INCLUDED_flixel_text_TypingCommand
#define INCLUDED_flixel_text_TypingCommand

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS2(flixel,text,TypingCommand)
namespace flixel{
namespace text{


class TypingCommand_obj : public ::hx::EnumBase_obj
{
	typedef ::hx::EnumBase_obj super;
		typedef TypingCommand_obj OBJ_;

	public:
		TypingCommand_obj() {};
		HX_DO_ENUM_RTTI;
		static void __boot();
		static void __register();
		static bool __GetStatic(const ::String &inName, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		::String GetEnumName( ) const { return HX_("flixel.text.TypingCommand",c5,3e,00,97); }
		::String __ToString() const { return HX_("TypingCommand.",3a,ce,fc,8e) + _hx_tag; }

		static ::flixel::text::TypingCommand COPY;
		static inline ::flixel::text::TypingCommand COPY_dyn() { return COPY; }
		static ::flixel::text::TypingCommand CUT;
		static inline ::flixel::text::TypingCommand CUT_dyn() { return CUT; }
		static ::flixel::text::TypingCommand DELETE_LEFT;
		static inline ::flixel::text::TypingCommand DELETE_LEFT_dyn() { return DELETE_LEFT; }
		static ::flixel::text::TypingCommand DELETE_RIGHT;
		static inline ::flixel::text::TypingCommand DELETE_RIGHT_dyn() { return DELETE_RIGHT; }
		static ::flixel::text::TypingCommand NEW_LINE;
		static inline ::flixel::text::TypingCommand NEW_LINE_dyn() { return NEW_LINE; }
		static ::flixel::text::TypingCommand PASTE;
		static inline ::flixel::text::TypingCommand PASTE_dyn() { return PASTE; }
		static ::flixel::text::TypingCommand SELECT_ALL;
		static inline ::flixel::text::TypingCommand SELECT_ALL_dyn() { return SELECT_ALL; }
};

} // end namespace flixel
} // end namespace text

#endif /* INCLUDED_flixel_text_TypingCommand */ 
