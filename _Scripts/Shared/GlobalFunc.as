﻿package Shared
{
    import Shared.AS3.BSScrollingList;
    import Shared.AS3.Events.CustomEvent;
    import Shared.AS3.SWFLoaderClip;
    import flash.display.DisplayObject;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import flash.system.fscommand;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.utils.ByteArray;
    import flash.utils.describeType;
    import flash.utils.getQualifiedClassName;

    public class GlobalFunc
    {
        public static const PIPBOY_GREY_OUT_ALPHA:Number = 0.5;
        public static const SELECTED_RECT_ALPHA:Number = 1;
        public static const DIMMED_ALPHA:Number = 0.65;
        public static const NUM_DAMAGE_TYPES:uint = 6;
        public static const MAX_TRUNCATED_TEXT_LENGTH = 42;

        protected static const CLOSE_ENOUGH_EPSILON:Number = 0.001;

        public static const MENU_SOUND_OK:String = "UIMenuOK";
        public static const MENU_SOUND_CANCEL:String = "UIMenuCancel";
        public static const MENU_SOUND_PREV_NEXT:String = "UIMenuPrevNext";
        public static const MENU_SOUND_POPUP:String = "UIMenuPopupGeneric";
        public static const MENU_SOUND_FOCUS_CHANGE:String = "UIMenuFocus";

        public static const BUTTON_BAR_ALIGN_CENTER:uint = 0;
        public static const BUTTON_BAR_ALIGN_LEFT:uint = 1;
        public static const BUTTON_BAR_ALIGN_RIGHT:uint = 2;

        public static const COLOR_TEXT_BODY:uint = 16777163;
        public static const COLOR_TEXT_HEADER:uint = 16108379;
        public static const COLOR_TEXT_SELECTED:uint = 1580061;
        public static const COLOR_TEXT_FRIEND:uint = COLOR_TEXT_HEADER;
        public static const COLOR_TEXT_ENEMY:uint = 16741472;
        public static const COLOR_TEXT_UNAVAILABLE:uint = 5661031;

        public static const COLOR_BACKGROUND_BOX:uint = 3225915;
        public static const COOR_WARNING:uint = 15089200;
        public static const COLOR_WARNING_ACCENT:uint = 16151129;

        public static var TEXT_SIZE_VERYSMALL:Number = 16;
        public static var TEXT_SIZE_MIN:Number = 14;
        public static var TEXT_LEADING_MIN:Number = -2;


        public function GlobalFunc()
        {
            super();
        }

        public static function CloneObject(param1:Object):*
        {
            var _loc2_:ByteArray = new ByteArray();
            _loc2_.writeObject(param1);
            _loc2_.position = 0;
            return _loc2_.readObject();
        }

        public static function Lerp(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Boolean):Number
        {
            var _loc7_:Number = param1 + (param5 - param3) / (param4 - param3) * (param2 - param1);
            if (param6)
            {
                if (param1 < param2)
                {
                    _loc7_ = Math.min(Math.max(_loc7_, param1), param2);
                }
                else
                {
                    _loc7_ = Math.min(Math.max(_loc7_, param2), param1);
                }
            }
            return _loc7_;
        }

        public static function PadNumber(param1:Number, param2:uint):String
        {
            var _loc3_:String = "" + param1;
            while (_loc3_.length < param2)
            {
                _loc3_ = "0" + _loc3_;
            }
            return _loc3_;
        }

        public static function ShortTimeString(param1:Number):String
        {
            var _loc2_:Number = 0;
            var _loc3_:TextField = new TextField();
            var _loc4_:Number = Math.floor(param1 / 86400);
            _loc2_ = param1 % 86400;
            var _loc5_:Number = Math.floor(_loc2_ / 3600);
            _loc2_ = param1 % 3600;
            var _loc6_:Number = Math.floor(_loc2_ / 60);
            _loc2_ = param1 % 60;
            var _loc7_:Number = Math.floor(_loc2_);
            var _loc8_:* = 0;
            if (_loc4_ >= 1)
            {
                _loc3_.text = "$ShortTimeDays";
                _loc8_ = _loc4_;
            }
            else if (_loc5_ >= 1)
            {
                _loc3_.text = "$ShortTimeHours";
                _loc8_ = _loc5_;
            }
            else if (_loc6_ >= 1)
            {
                _loc3_.text = "$ShortTimeMinutes";
                _loc8_ = _loc6_;
            }
            else if (_loc7_ >= 1)
            {
                _loc3_.text = "$ShortTimeSeconds";
                _loc8_ = _loc7_;
            }
            else
            {
                _loc3_.text = "$ShortTimeSecond";
                _loc8_ = _loc7_;
            }
            if (_loc8_ != 0)
            {
                _loc3_.text = _loc3_.text.replace("{time}", _loc8_.toString());
                return _loc3_.text;
            }
            return "0";
        }

        public static function SimpleTimeString(param1:Number):String
        {
            var _loc2_:Number = 0;
            var _loc3_:TextField = new TextField();
            var _loc4_:Number = Math.floor(param1 / 86400);
            _loc2_ = param1 % 86400;
            var _loc5_:Number = Math.floor(_loc2_ / 3600);
            _loc2_ = param1 % 3600;
            var _loc6_:Number = Math.floor(_loc2_ / 60);
            _loc2_ = param1 % 60;
            var _loc7_:Number = Math.floor(_loc2_);
            var _loc8_:* = 0;
            if (_loc4_ > 1)
            {
                _loc3_.text = "$SimpleTimeDays";
                _loc8_ = _loc4_;
            }
            else if (_loc4_ == 1)
            {
                _loc3_.text = "$SimpleTimeDay";
                _loc8_ = _loc4_;
            }
            else if (_loc5_ > 1)
            {
                _loc3_.text = "$SimpleTimeHours";
                _loc8_ = _loc5_;
            }
            else if (_loc5_ == 1)
            {
                _loc3_.text = "$SimpleTimeHour";
                _loc8_ = _loc5_;
            }
            else if (_loc6_ > 1)
            {
                _loc3_.text = "$SimpleTimeMinutes";
                _loc8_ = _loc6_;
            }
            else if (_loc6_ == 1)
            {
                _loc3_.text = "$SimpleTimeMinute";
                _loc8_ = _loc6_;
            }
            else if (_loc7_ > 1)
            {
                _loc3_.text = "$SimpleTimeSeconds";
                _loc8_ = _loc7_;
            }
            else if (_loc7_ == 1)
            {
                _loc3_.text = "$SimpleTimeSecond";
                _loc8_ = _loc7_;
            }
            if (_loc8_ != 0)
            {
                _loc3_.text = _loc3_.text.replace("{time}", _loc8_.toString());
                return _loc3_.text;
            }
            return "0";
        }

        public static function FormatTimeString(param1:Number):String
        {
            var _loc2_:Number = 0;
            var _loc3_:Number = Math.floor(param1 / 86400);
            _loc2_ = param1 % 86400;
            var _loc4_:Number = Math.floor(_loc2_ / 3600);
            _loc2_ = param1 % 3600;
            var _loc5_:Number = Math.floor(_loc2_ / 60);
            _loc2_ = param1 % 60;
            var _loc6_:Number = Math.floor(_loc2_);
            var _loc7_:Boolean = false;
            var _loc8_:* = "";
            if (_loc3_ > 0)
            {
                _loc8_ = PadNumber(_loc3_, 2);
                _loc7_ = true;
            }
            if (_loc3_ > 0 || _loc4_ > 0)
            {
                if (_loc7_)
                {
                    _loc8_ = _loc8_ + ":";
                }
                else
                {
                    _loc7_ = true;
                }
                _loc8_ = _loc8_ + PadNumber(_loc4_, 2);
            }
            if (_loc3_ > 0 || _loc4_ > 0 || _loc5_ > 0)
            {
                if (_loc7_)
                {
                    _loc8_ = _loc8_ + ":";
                }
                else
                {
                    _loc7_ = true;
                }
                _loc8_ = _loc8_ + PadNumber(_loc5_, 2);
            }
            if (_loc3_ > 0 || _loc4_ > 0 || _loc5_ > 0 || _loc6_ > 0)
            {
                if (_loc7_)
                {
                    _loc8_ = _loc8_ + ":";
                }
                else if (_loc3_ == 0 && _loc4_ == 0 && _loc5_ == 0)
                {
                    _loc8_ = "0:";
                }
                _loc8_ = _loc8_ + PadNumber(_loc6_, 2);
            }
            return _loc8_;
        }

        public static function RoundDecimal(param1:Number, param2:Number):Number
        {
            var _loc3_:Number = Math.pow(10, param2);
            return Math.round(_loc3_ * param1) / _loc3_;
        }

        public static function CloseToNumber(param1:Number, param2:Number, param3:Number = 0.001):Boolean
        {
            return Math.abs(param1 - param2) < param3;
        }

        public static function Clamp(param1:Number, param2:Number, param3:Number):Number
        {
            return Math.max(param2, Math.min(param3, param1));
        }

        public static function MaintainTextFormat():*
        {
            TextField.prototype.SetText = function(param1:String, param2:Boolean = false, param3:Boolean = false):*
            {
                var _loc5_:Number = NaN;
                var _loc6_:Boolean = false;
                if (!param1 || param1 == "")
                {
                    param1 = " ";
                }
                if (param3 && param1.charAt(0) != "$")
                {
                    param1 = param1.toUpperCase();
                }
                var _loc4_:TextFormat = this.getTextFormat();
                if (param2)
                {
                    _loc5_ = Number(_loc4_.letterSpacing);
                    _loc6_ = _loc4_.kerning;
                    this.htmlText = param1;
                    _loc4_ = this.getTextFormat();
                    _loc4_.letterSpacing = _loc5_;
                    _loc4_.kerning = _loc6_;
                    this.setTextFormat(_loc4_);
                    this.htmlText = param1;
                }
                else
                {
                    this.text = param1;
                    this.setTextFormat(_loc4_);
                    this.text = param1;
                }
            };
        }

        public static function SetText(param1:TextField, param2:String, bSetHTML:Boolean = false, bForceUppercase:Boolean = false, bTruncate:Boolean = false):*
        {
            var _loc6_:TextFormat = null;
            var _loc7_:Number = NaN;
            var _loc8_:Boolean = false;
            if (!param2 || param2 == "")
            {
                param2 = " ";
            }
            if (bForceUppercase && param2.charAt(0) != "$")
            {
                param2 = param2.toUpperCase();
            }
            if (bSetHTML)
            {
                _loc6_ = param1.getTextFormat();
                _loc7_ = Number(_loc6_.letterSpacing);
                _loc8_ = _loc6_.kerning;
                param1.htmlText = param2;
                _loc6_ = param1.getTextFormat();
                _loc6_.letterSpacing = _loc7_;
                _loc6_.kerning = _loc8_;
                param1.setTextFormat(_loc6_);
            }
            else
            {
                param1.text = param2;
            }
            if (bTruncate && param1.text.length > MAX_TRUNCATED_TEXT_LENGTH)
            {
                param1.text = param1.text.slice(0, MAX_TRUNCATED_TEXT_LENGTH - 3) + "...";
            }
        }

        public static function AddMovieExploreFunctions():*
        {
            MovieClip.prototype.getMovieClips = function():Array
            {
                var _loc2_:* = undefined;
                var _loc1_:* = new Array();
                for (_loc2_ in this)
                {
                    if (this[_loc2_] is MovieClip && this[_loc2_] != this)
                    {
                        _loc1_.push(this[_loc2_]);
                    }
                }
                return _loc1_;
            };
            MovieClip.prototype.showMovieClips = function():*
            {
                var _loc1_:* = undefined;
                for (_loc1_ in this)
                {
                    if (this[_loc1_] is MovieClip && this[_loc1_] != this)
                    {
                        trace(this[_loc1_]);
                        this[_loc1_].showMovieClips();
                    }
                }
            };
        }

        public static function InspectObject(param1:Object, param2:Boolean = false, param3:Boolean = false):void
        {
            var _loc4_:String = getQualifiedClassName(param1);
            trace("Inspecting object with type " + _loc4_);
            trace("{");
            InspectObjectHelper(param1, param2, param3);
            trace("}");
        }

        private static function InspectObjectHelper(param1:Object, param2:Boolean, param3:Boolean, param4:String = "\t"):void
        {
            var member:XML = null;
            var constMember:XML = null;
            var id:String = null;
            var prop:XML = null;
            var propName:String = null;
            var propValue:Object = null;
            var memberName:String = null;
            var memberValue:Object = null;
            var constMemberName:String = null;
            var constMemberValue:Object = null;
            var value:Object = null;
            var subid:String = null;
            var subvalue:Object = null;
            var aObject:Object = param1;
            var abRecursive:Boolean = param2;
            var abIncludeProperties:Boolean = param3;
            var astrIndent:String = param4;
            var typeDef:XML = describeType(aObject);
            if (abIncludeProperties)
            {
                for each (prop in typeDef.accessor.(@access == "readwrite" || @access == "readonly"))
                {
                    propName = prop.@name;
                    propValue = aObject[prop.@name];
                    trace(astrIndent + propName + " = " + propValue);
                    if (abRecursive)
                    {
                        InspectObjectHelper(propValue, abRecursive, abIncludeProperties, astrIndent + "\t");
                    }
                }
            }
            for each (member in typeDef.variable)
            {
                memberName = member.@name;
                memberValue = aObject[memberName];
                trace(astrIndent + memberName + " = " + memberValue);
                if (abRecursive)
                {
                    InspectObjectHelper(memberValue, true, abIncludeProperties, astrIndent + "\t");
                }
            }
            for each (constMember in typeDef.constant)
            {
                constMemberName = constMember.@name;
                constMemberValue = aObject[constMemberName];
                trace(astrIndent + constMemberName + " = " + constMemberValue + " --const");
                if (abRecursive)
                {
                    InspectObjectHelper(constMemberValue, true, abIncludeProperties, astrIndent + "\t");
                }
            }
            for (id in aObject)
            {
                value = aObject[id];
                trace(astrIndent + id + " = " + value);
                if (abRecursive)
                {
                    InspectObjectHelper(value, true, abIncludeProperties, astrIndent + "\t");
                }
                else
                {
                    for (subid in value)
                    {
                        subvalue = value[subid];
                        trace(astrIndent + "\t" + subid + " = " + subvalue);
                    }
                }
            }
        }

        public static function AddReverseFunctions():*
        {
            MovieClip.prototype.PlayReverseCallback = function(param1:Event):*
            {
                if (param1.currentTarget.currentFrame > 1)
                {
                    param1.currentTarget.gotoAndStop(param1.currentTarget.currentFrame - 1);
                }
                else
                {
                    param1.currentTarget.removeEventListener(Event.ENTER_FRAME, param1.currentTarget.PlayReverseCallback);
                }
            };
            MovieClip.prototype.PlayReverse = function():*
            {
                if (this.currentFrame > 1)
                {
                    this.gotoAndStop(this.currentFrame - 1);
                    this.addEventListener(Event.ENTER_FRAME, this.PlayReverseCallback);
                }
                else
                {
                    this.gotoAndStop(1);
                }
            };
            MovieClip.prototype.PlayForward = function(param1:String):*
            {
                delete this.onEnterFrame;
                this.gotoAndPlay(param1);
            };
            MovieClip.prototype.PlayForward = function(param1:Number):*
            {
                delete this.onEnterFrame;
                this.gotoAndPlay(param1);
            };
        }

        public static function shrinkMultiLineTextToFit(param1:TextField, param2:Number = 0):void
        {
            var _loc3_:TextFormat = param1.getTextFormat();
            if (param2 == 0)
            {
                param2 = _loc3_.size as Number;
            }
            var _loc4_:Number = param2;
            _loc3_.size = _loc4_;
            param1.setTextFormat(_loc3_);
            while (getTextfieldSize(param1) > param1.height && _loc4_ > TEXT_SIZE_MIN)
            {
                _loc4_--;
                _loc3_.size = _loc4_;
                param1.setTextFormat(_loc3_);
            }
        }

        public static function getTextfieldSize(param1:TextField, param2:Boolean = true):*
        {
            var _loc3_:Number = NaN;
            var _loc4_:uint = 0;
            if (param1.multiline)
            {
                _loc3_ = 0;
                _loc4_ = 0;
                while (_loc4_ < param1.numLines)
                {
                    _loc3_ = _loc3_ + (!!param2 ? param1.getLineMetrics(_loc4_).height : param1.getLineMetrics(_loc4_).width);
                    _loc4_++;
                }
                return _loc3_;
            }
            return !!param2 ? param1.textHeight : param1.textWidth;
        }

        public static function getDisplayObjectSize(param1:DisplayObject, param2:Boolean = false):*
        {
            if (param1 is BSScrollingList)
            {
                return (param1 as BSScrollingList).shownItemsHeight;
            }
            if (param1 is MovieClip)
            {
                if (param1["Sizer_mc"] != undefined && param1["Sizer_mc"] != null)
                {
                    return !!param2 ? param1["Sizer_mc"].height : param1["Sizer_mc"].width;
                }
                if (param1["textField"] != null)
                {
                    return getTextfieldSize(param1["textField"], param2);
                }
                if (param1["displayHeight"] != null)
                {
                    return param1["displayHeight"];
                }
                return !!param2 ? param1.height : param1.width;
            }
            if (param1 is TextField)
            {
                return getTextfieldSize(param1 as TextField, param2);
            }
            throw new Error("GlobalFunc.getDisplayObjectSize: unsupported object type");
        }

        public static function StringTrim(param1:String):String
        {
            var _loc5_:String = null;
            var _loc2_:Number = 0;
            var _loc3_:Number = 0;
            var _loc4_:Number = param1.length;
            while (param1.charAt(_loc2_) == " " || param1.charAt(_loc2_) == "\n" || param1.charAt(_loc2_) == "\r" || param1.charAt(_loc2_) == "\t")
            {
                _loc2_++;
            }
            _loc5_ = param1.substring(_loc2_);
            _loc3_ = _loc5_.length - 1;
            while (_loc5_.charAt(_loc3_) == " " || _loc5_.charAt(_loc3_) == "\n" || _loc5_.charAt(_loc3_) == "\r" || _loc5_.charAt(_loc3_) == "\t")
            {
                _loc3_--;
            }
            _loc5_ = _loc5_.substring(0, _loc3_ + 1);
            return _loc5_;
        }

        public static function BSASSERT(param1:Boolean, param2:String):void
        {
            var _loc3_:String = null;
            if (!param1)
            {
                _loc3_ = new Error().getStackTrace();
                fscommand("BSASSERT", param2 + "\nCallstack:\n" + _loc3_);
            }
        }

        public static function HasFFEvent(param1:Object, param2:String):Boolean
        {
            var obj:Object = null;
            var aDataObject:Object = param1;
            var asEventString:String = param2;
            var result:Boolean = false;
            try
            {
                if (aDataObject.eventArray.length > 0)
                {
                    for each (obj in aDataObject.eventArray)
                    {
                        if (obj.eventName == asEventString)
                        {
                            result = true;
                            break;
                        }
                    }
                }
            }
            catch (e:Error)
            {
                trace(e.getStackTrace() + " The following Fire Forget Event object could not be parsed:");
                GlobalFunc.InspectObject(aDataObject, true);
            }
            return result;
        }

        public static function LocalizeFormattedString(param1:String, ... rest):String
        {
            var _loc3_:String = "";
            var _loc4_:TextField = new TextField();
            _loc4_.text = param1;
            _loc3_ = _loc4_.text;
            var _loc5_:uint = 0;
            while (_loc5_ < rest.length)
            {
                _loc4_.text = rest[_loc5_];
                _loc3_ = _loc3_.replace("{" + (_loc5_ + 1) + "}", _loc4_.text);
                _loc5_++;
            }
            return _loc3_;
        }
    }
}
