<?php
namespace wcf\system\cache\builder;
use wcf\data\user\notification\event\UserNotificationEvent;
use wcf\system\WCF;

/**
 * Caches user notification events.
 *
 * @author	Marcell Werk, Oliver Kliebisch
 * @copyright	2001-2011 WoltLab GmbH, Oliver Kliebisch
 * @license	GNU Lesser General Public License <http://opensource.org/licenses/lgpl-license.php>
 * @package	com.woltlab.wcf.notification
 * @subpackage	system.cache.builder
 * @category 	Community Framework
 */
class UserNotificationEventCacheBuilder implements ICacheBuilder {
	/**
	 * @see wcf\system\cache\ICacheBuilder::getData()
	 */
	public function getData(array $cacheResource) {
		$data = array();
		
		// get package id
		$tmp = explode('-', $cacheResource['cache']);
		$packageID = array_pop($tmp);
		
		// get events
		$sql = "SELECT		event.*, object_type.objectType
			FROM		wcf".WCF_N."_package_dependency package_dependency,
					wcf".WCF_N."_user_notification_event event
			LEFT JOIN	wcf".WCF_N."_object_type object_type
			ON		(object_type.objectTypeID = event.objectTypeID)
			WHERE 		event.packageID = package_dependency.dependency
					AND package_dependency.packageID = ?
			ORDER BY	package_dependency.priority DESC";
		$statement = WCF::getDB()->prepareStatement($sql);
		$statement->execute(array($packageID));
		while ($row = $statement->fetchArray()) {
			if (!isset($data[$row['objectType']])) {
				$data[$row['objectType']] = array();
			}
			
			if (!isset($data[$row['objectType']][$row['eventName']])) {
				$databaseObject = new UserNotificationEvent(null, $row);
				$data[$row['objectType']][$row['eventName']] = $databaseObject->getProcessor();
			}
		}
		
		return $data;
	}
}
