
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
import mx.collections.ArrayCollection;
import mx.events.ValidationResultEvent;
import valueObjects.Product;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IModelType;
import mx.events.PropertyChangeEvent;

use namespace model_internal;

[ExcludeClass]
internal class _TemplatesService_ProductsEntityMetadata extends com.adobe.fiber.valueobjects.AbstractEntityMetadata
{
    private static var emptyArray:Array = new Array();

    model_internal static var allProperties:Array = new Array("products", "product");
    model_internal static var allAssociationProperties:Array = new Array();
    model_internal static var allRequiredProperties:Array = new Array("products", "product");
    model_internal static var allAlwaysAvailableProperties:Array = new Array("products", "product");
    model_internal static var guardedProperties:Array = new Array();
    model_internal static var dataProperties:Array = new Array("products", "product");
    model_internal static var sourceProperties:Array = emptyArray
    model_internal static var nonDerivedProperties:Array = new Array("products", "product");
    model_internal static var derivedProperties:Array = new Array();
    model_internal static var collectionProperties:Array = new Array("product");
    model_internal static var collectionBaseMap:Object;
    model_internal static var entityName:String = "TemplatesService_Products";
    model_internal static var dependentsOnMap:Object;
    model_internal static var dependedOnServices:Array = new Array();
    model_internal static var propertyTypeMap:Object;

    
    model_internal var _productsIsValid:Boolean;
    model_internal var _productsValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _productsIsValidCacheInitialized:Boolean = false;
    model_internal var _productsValidationFailureMessages:Array;
    
    model_internal var _productIsValid:Boolean;
    model_internal var _productValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _productIsValidCacheInitialized:Boolean = false;
    model_internal var _productValidationFailureMessages:Array;

    model_internal var _instance:_Super_TemplatesService_Products;
    model_internal static var _nullStyle:com.adobe.fiber.styles.Style = new com.adobe.fiber.styles.Style();

    public function _TemplatesService_ProductsEntityMetadata(value : _Super_TemplatesService_Products)
    {
        // initialize property maps
        if (model_internal::dependentsOnMap == null)
        {
            // dependents map
            model_internal::dependentsOnMap = new Object();
            model_internal::dependentsOnMap["products"] = new Array();
            model_internal::dependentsOnMap["product"] = new Array();

            // collection base map
            model_internal::collectionBaseMap = new Object();
            model_internal::collectionBaseMap["product"] = "valueObjects.Product";
        }

        // Property type Map
        model_internal::propertyTypeMap = new Object();
        model_internal::propertyTypeMap["products"] = "String";
        model_internal::propertyTypeMap["product"] = "ArrayCollection";

        model_internal::_instance = value;
        model_internal::_productsValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForProducts);
        model_internal::_productsValidator.required = true;
        model_internal::_productsValidator.requiredFieldError = "products is required";
        //model_internal::_productsValidator.source = model_internal::_instance;
        //model_internal::_productsValidator.property = "products";
        model_internal::_productValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForProduct);
        model_internal::_productValidator.required = true;
        model_internal::_productValidator.requiredFieldError = "product is required";
        //model_internal::_productValidator.source = model_internal::_instance;
        //model_internal::_productValidator.property = "product";
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
            throw new Error(propertyName + " is not a data property of entity TemplatesService_Products");
            
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
            throw new Error(propertyName + " is not a collection property of entity TemplatesService_Products");

        return model_internal::collectionBaseMap[propertyName];
    }
    
    override public function getPropertyType(propertyName:String):String
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a property of TemplatesService_Products");

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
            throw new Error(propertyName + " does not exist for entity TemplatesService_Products");
        }

        return model_internal::_instance[propertyName];
    }

    override public function setValue(propertyName:String, value:*):void
    {
        if (model_internal::nonDerivedProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " is not a modifiable property of entity TemplatesService_Products");
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
            throw new Error(propertyName + " does not exist for entity TemplatesService_Products");
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
    public function get isProductsAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isProductAvailable():Boolean
    {
        return true;
    }


    /**
     * derived property recalculation
     */
    public function invalidateDependentOnProducts():void
    {
        if (model_internal::_productsIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfProducts = null;
            model_internal::calculateProductsIsValid();
        }
    }
    public function invalidateDependentOnProduct():void
    {
        if (model_internal::_productIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfProduct = null;
            model_internal::calculateProductIsValid();
        }
    }

    model_internal function fireChangeEvent(propertyName:String, oldValue:Object, newValue:Object):void
    {
        this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, propertyName, oldValue, newValue));
    }

    [Bindable(event="propertyChange")]   
    public function get productsStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get productsValidator() : StyleValidator
    {
        return model_internal::_productsValidator;
    }

    model_internal function set _productsIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_productsIsValid;         
        if (oldValue !== value)
        {
            model_internal::_productsIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "productsIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get productsIsValid():Boolean
    {
        if (!model_internal::_productsIsValidCacheInitialized)
        {
            model_internal::calculateProductsIsValid();
        }

        return model_internal::_productsIsValid;
    }

    model_internal function calculateProductsIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_productsValidator.validate(model_internal::_instance.products)
        model_internal::_productsIsValid_der = (valRes.results == null);
        model_internal::_productsIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::productsValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::productsValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get productsValidationFailureMessages():Array
    {
        if (model_internal::_productsValidationFailureMessages == null)
            model_internal::calculateProductsIsValid();

        return _productsValidationFailureMessages;
    }

    model_internal function set productsValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_productsValidationFailureMessages;

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
            model_internal::_productsValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "productsValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get productStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get productValidator() : StyleValidator
    {
        return model_internal::_productValidator;
    }

    model_internal function set _productIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_productIsValid;         
        if (oldValue !== value)
        {
            model_internal::_productIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "productIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get productIsValid():Boolean
    {
        if (!model_internal::_productIsValidCacheInitialized)
        {
            model_internal::calculateProductIsValid();
        }

        return model_internal::_productIsValid;
    }

    model_internal function calculateProductIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_productValidator.validate(model_internal::_instance.product)
        model_internal::_productIsValid_der = (valRes.results == null);
        model_internal::_productIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::productValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::productValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get productValidationFailureMessages():Array
    {
        if (model_internal::_productValidationFailureMessages == null)
            model_internal::calculateProductIsValid();

        return _productValidationFailureMessages;
    }

    model_internal function set productValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_productValidationFailureMessages;

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
            model_internal::_productValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "productValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
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
            case("products"):
            {
                return productsValidationFailureMessages;
            }
            case("product"):
            {
                return productValidationFailureMessages;
            }
            default:
            {
                return emptyArray;
            }
         }
     }

}

}
