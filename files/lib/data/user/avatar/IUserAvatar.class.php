<?php
namespace wcf\data\user\avatar;

/**
 * Any displayable avatar type should implement this class.
 * 
 * @author	Marcel Werk
 * @copyright	2001-2012 WoltLab GmbH
 * @license	GNU Lesser General Public License <http://opensource.org/licenses/lgpl-license.php>
 * @package	com.woltlab.wcf.user
 * @subpackage	data.user.avatar
 * @category 	Community Framework
 */
interface IUserAvatar {
	/**
	 * Returns the url to this avatar.
	 * 
	 * @param	integer		$size
	 * @return	string
	 */
	public function getURL($size = null);
	
	/**
	 * Returns the html code to display this avatar.
	 * 
	 * @param	integer		$size
	 * @return	string
	 */
	public function getImageTag($size = null);
	
	/**
	 * Returns the width of this avatar.
	 *
	 * @return	integer
	 */
	public function getWidth();
	
	/**
	 * Returns the height of this avatar.
	 *
	 * @return	integer
	 */
	public function getHeight();
}
