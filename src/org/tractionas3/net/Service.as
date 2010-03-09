package org.tractionas3.net {	import org.tractionas3.core.interfaces.ICallable;	import org.tractionas3.core.interfaces.ICoreInterface;	import org.tractionas3.events.ServiceEvent;	import org.tractionas3.events.WeakEventDispatcher;	/**	 * Service provides a base class for remote services.	 */	public class Service extends WeakEventDispatcher implements ICoreInterface, ICallable 	{		public function Service()		{			super();		}		/**		 * @inheritDoc		 */		override public function destruct(deepDestruct:Boolean = false):void		{			super.destruct();		}		/**		 * Executes the service.		 */		public function call(...arguments:Array):Boolean		{			return false;		}		/**		 * Handler for service results.		 * Override for extendablity.		 */		protected function onServiceResult(result:Object):void		{			var			resultEvent:ServiceEvent = new ServiceEvent(ServiceEvent.RESULT);			resultEvent.result = result;						dispatchEvent(resultEvent);						destruct();		}		/**		 * Handler for service faults.		 * Override for extendablity.		 */		protected function onServiceFault(info:Object):void		{			if(hasEventListener(ServiceEvent.FAULT))			{				var				faultEvent:ServiceEvent = new ServiceEvent(ServiceEvent.FAULT);								var errorCode:String;								for each(var property:String in info)				{					errorCode += property + "\n";				}								faultEvent.errorCode = errorCode;								dispatchEvent(faultEvent);			}			else			{				throw new Error(info.toString());			}						destruct();		}	}}