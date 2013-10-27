
/**
 * This is a generated class and is not intended for modification.  
 */
package valueObjects
{
import com.adobe.fiber.styles.IStyle;
import com.adobe.fiber.styles.Style;
import com.adobe.fiber.styles.StyleValidator;
import com.adobe.fiber.valueobjects.AbstractEntityMetadata;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import mx.events.ValidationResultEvent;
import valueObjects.Details;
import valueObjects.Templates;
import valueObjects.TemplatesService_Products;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IModelType;
import mx.events.PropertyChangeEvent;

use namespace model_internal;

[ExcludeClass]
internal class _RootEntityMetadata extends com.adobe.fiber.valueobjects.AbstractEntityMetadata
{
    private static var emptyArray:Array = new Array();

    model_internal static var allProperties:Array = new Array("details", "templates", "products");
    model_internal static var allAssociationProperties:Array = new Array();
    model_internal static var allRequiredProperties:Array = new Array("details", "templates");
    model_internal static var allAlwaysAvailableProperties:Array = new Array("details", "templates", "products");
    model_internal static var guardedProperties:Array = new Array();
    model_internal static var dataProperties:Array = new Array("details", "templates", "products");
    model_internal static var sourceProperties:Array = emptyArray
    model_internal static var nonDerivedProperties:Array = new Array("details", "templates", "products");
    model_internal static var derivedProperties:Array = new Array();
    model_internal static var collectionProperties:Array = new Array();
    model_internal static var collectionBaseMap:Object;
    model_internal static var entityName:String = "Root";
    model_internal static var dependentsOnMap:Object;
    model_internal static var dependedOnServices:Array = new Array();
    model_internal static var propertyTypeMap:Object;

    
    model_internal var _detailsIsValid:Boolean;
    model_internal var _detailsValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _detailsIsValidCacheInitialized:Boolean = false;
    model_internal var _detailsValidationFailureMessages:Array;
    
    model_internal var _templatesIsValid:Boolean;
    model_internal var _templatesValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _templatesIsValidCacheInitialized:Boolean = false;
    model_internal var _templatesValidationFailureMessages:Array;

    model_internal var _instance:_Super_Root;
    model_internal static var _nullStyle:com.adobe.fiber.styles.Style = new com.adobe.fiber.styles.Style();

    public function _RootEntityMetadata(value : _Super_Root)
    {
        // initialize property maps
        if (model_internal::dependentsOnMap == null)
        {
            // dependents map
            model_internal::dependentsOnMap = new Object();
            model_internal::dependentsOnMap["details"] = new Array();
            model_internal::dependentsOnMap["templates"] = new Array();
            model_internal::dependentsOnMap["products"] = new Array();

            // collection base map
            model_internal::collectionBaseMap = new Object();
        }

        // Property type Map
        model_internal::propertyTypeMap = new Object();
        model_internal::propertyTypeMap["details"] = "valueObjects.Details";
        model_internal::propertyTypeMap["templates"] = "valueObjects.Templates";
        model_internal::propertyTypeMap["products"] = "valueObjects.TemplatesService_Products";

        model_internal::_instance = value;
        model_internal::_detailsValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForDetails);
        model_internal::_detailsValidator.required = true;
        model_internal::_detailsValidator.requiredFieldError = "details is required";
        //model_internal::_detailsValidator.source = model_internal::_instance;
        //model_internal::_detailsValidator.property = "details";
        model_internal::_templatesValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForTemplates);
        model_internal::_templatesValidator.required = true;
        model_internal::_templatesValidator.requiredFieldError = "templates is required";
        //model_internal::_templatesValidator.source = model_internal::_instance;
        //model_internal::_templatesValidator.property = "templates";
    }

    override public function getEntityName():String
    {
        return model_internal::entityName;
    }

    override public function getProperties():Array
    {
        return model_internal::allProperties;
    }

    override public function getAssociationProperties():Array
    {
        return model_internal::allAssociationProperties;
    }

    override public function getRequiredProperties():Array
    {
         return model_internal::allRequiredProperties;   
    }

    override public function getDataProperties():Array
    {
        return model_internal::dataProperties;
    }

    public function getSourceProperties():Array
    {
        return model_internal::sourceProperties;
    }

    public function getNonDerivedProperties():Array
    {
        return model_internal::nonDerivedProperties;
    }

    override public function getGuardedProperties():Array
    {
        return model_internal::guardedProperties;
    }

    override public function getUnguardedProperties():Array
    {
        return model_internal::allAlwaysAvailableProperties;
    }

    override public function getDependants(propertyName:String):Array
    {
       if (model_internal::nonDerivedProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a data property of entity Root");
            
       return model_internal::dependentsOnMap[propertyName] as Array;  
    }

    override public function getDependedOnServices():Array
    {
        return model_internal::dependedOnServices;
    }

    override public function getCollectionProperties():Array
    {
        return model_internal::collectionProperties;
    }

    override public function getCollectionBase(propertyName:String):String
    {
        if (model_internal::collectionProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a collection property of entity Root");

        return model_internal::collectionBaseMap[propertyName];
    }
    
    override public function getPropertyType(propertyName:String):String
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a property of Root");

        return model_internal::propertyTypeMap[propertyName];
    }

    override public function getAvailableProperties():com.adobe.fiber.valueobjects.IPropertyIterator
    {
        return new com.adobe.fiber.valueobjects.AvailablePropertyIterator(this);
    }

    override public function getValue(propertyName:String):*
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " does not exist for entity Root");
        }

        return model_internal::_instance[propertyName];
    }

    override public function setValue(propertyName:String, value:*):void
    {
        if (model_internal::nonDerivedProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " is not a modifiable property of entity Root");
        }

        model_internal::_instance[propertyName] = value;
    }

    override public function getMappedByProperty(associationProperty:String):String
    {
        switch(associationProperty)
        {
            default:
            {
                return null;
            }
        }
    }

    override public function getPropertyLength(propertyName:String):int
    {
        switch(propertyName)
        {
            default:
            {
                return 0;
            }
        }
    }

    override public function isAvailable(propertyName:String):Boolean
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " does not exist for entity Root");
        }

        if (model_internal::allAlwaysAvailableProperties.indexOf(propertyName) != -1)
        {
            return true;
        }

        switch(propertyName)
        {
            default:
            {
                return true;
            }
        }
    }

    override public function getIdentityMap():Object
    {
        var returnMap:Object = new Object();

        return returnMap;
    }

    [Bindable(event="propertyChange")]
    override public function get invalidConstraints():Array
    {
        if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
        {
            return model_internal::_instance.model_internal::_invalidConstraints;
        }
        else
        {
            // recalculate isValid
            model_internal::_instance.model_internal::_isValid = model_internal::_instance.model_internal::calculateIsValid();
            return model_internal::_instance.model_internal::_invalidConstraints;        
        }
    }

    [Bindable(event="propertyChange")]
    override public function get validationFailureMessages():Array
    {
        if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
        {
            return model_internal::_instance.model_internal::_validationFailureMessages;
        }
        else
        {
            // recalculate isValid
            model_internal::_instance.model_internal::_isValid = model_internal::_instance.model_internal::calculateIsValid();
            return model_internal::_instance.model_internal::_validationFailureMessages;
        }
    }

    override public function getDependantInvalidConstraints(propertyName:String):Array
    {
        var dependants:Array = getDependants(propertyName);
        if (dependants.length == 0)
        {
            return emptyArray;
        }

        var currentlyInvalid:Array = invalidConstraints;
        if (currentlyInvalid.length == 0)
        {
            return emptyArray;
        }

        var filterFunc:Function = function(element:*, index:int, arr:Array):Boolean
        {
            return dependants.indexOf(element) > -1;
        }

        return currentlyInvalid.filter(filterFunc);
    }

    /**
     * isValid
     */
    [Bindable(event="propertyChange")] 
    public function get isValid() : Boolean
    {
        if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
        {
            return model_internal::_instance.model_internal::_isValid;
        }
        else
        {
            // recalculate isValid
            model_internal::_instance.model_internal::_isValid = model_internal::_instance.model_internal::calculateIsValid();
            return model_internal::_instance.model_internal::_isValid;
        }
    }

    [Bindable(event="propertyChange")]
    public function get isDetailsAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isTemplatesAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isProductsAvailable():Boolean
    {
        return true;
    }


    /**
     * derived property recalculation
     */
    public function invalidateDependentOnDetails():void
    {
        if (model_internal::_detailsIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfDetails = null;
            model_internal::calculateDetailsIsValid();
        }
    }
    public function invalidateDependentOnTemplates():void
    {
        if (model_internal::_templatesIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfTemplates = null;
            model_internal::calculateTemplatesIsValid();
        }
    }

    model_internal function fireChangeEvent(propertyName:String, oldValue:Object, newValue:Object):void
    {
        this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, propertyName, oldValue, newValue));
    }

    [Bindable(event="propertyChange")]   
    public function get detailsStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get detailsValidator() : StyleValidator
    {
        return model_internal::_detailsValidator;
    }

    model_internal function set _detailsIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_detailsIsValid;         
        if (oldValue !== value)
        {
            model_internal::_detailsIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "detailsIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get detailsIsValid():Boolean
    {
        if (!model_internal::_detailsIsValidCacheInitialized)
        {
            model_internal::calculateDetailsIsValid();
        }

        return model_internal::_detailsIsValid;
    }

    model_internal function calculateDetailsIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_detailsValidator.validate(model_internal::_instance.details)
        model_internal::_detailsIsValid_der = (valRes.results == null);
        model_internal::_detailsIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::detailsValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::detailsValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get detailsValidationFailureMessages():Array
    {
        if (model_internal::_detailsValidationFailureMessages == null)
            model_internal::calculateDetailsIsValid();

        return _detailsValidationFailureMessages;
    }

    model_internal function set detailsValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_detailsValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_detailsValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "detailsValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get templatesStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get templatesValidator() : StyleValidator
    {
        return model_internal::_templatesValidator;
    }

    model_internal function set _templatesIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_templatesIsValid;         
        if (oldValue !== value)
        {
            model_internal::_templatesIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "templatesIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get templatesIsValid():Boolean
    {
        if (!model_internal::_templatesIsValidCacheInitialized)
        {
            model_internal::calculateTemplatesIsValid();
        }

        return model_internal::_templatesIsValid;
    }

    model_internal function calculateTemplatesIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_templatesValidator.validate(model_internal::_instance.templates)
        model_internal::_templatesIsValid_der = (valRes.results == null);
        model_internal::_templatesIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::templatesValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::templatesValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get templatesValidationFailureMessages():Array
    {
        if (model_internal::_templatesValidationFailureMessages == null)
            model_internal::calculateTemplatesIsValid();

        return _templatesValidationFailureMessages;
    }

    model_internal function set templatesValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_templatesValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_templatesValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "templatesValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get productsStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }


     /**
     * 
     * @inheritDoc 
     */ 
     override public function getStyle(propertyName:String):com.adobe.fiber.styles.IStyle
     {
         switch(propertyName)
         {
            default:
            {
                return null;
            }
         }
     }
     
     /**
     * 
     * @inheritDoc 
     *  
     */  
     override public function getPropertyValidationFailureMessages(propertyName:String):Array
     {
         switch(propertyName)
         {
            case("details"):
            {
                return detailsValidationFailureMessages;
            }
            case("templates"):
            {
                return templatesValidationFailureMessages;
            }
            default:
            {
                return emptyArray;
            }
         }
     }

}

}
