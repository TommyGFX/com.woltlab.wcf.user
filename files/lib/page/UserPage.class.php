<?php
namespace wcf\page;
use wcf\data\user\User;
use wcf\system\exception\IllegalLinkException;
use wcf\system\menu\user\profile\UserProfileMenu;
use wcf\system\WCF;

/**
 * Shows the user profile page.
 * 
 * @author	Marcel Werk
 * @copyright	2001-2011 WoltLab GmbH
 * @license	GNU Lesser General Public License <http://opensource.org/licenses/lgpl-license.php>
 * @package	com.woltlab.wcf.user
 * @subpackage	page
 * @category 	Community Framework
 */
class UserPage extends AbstractPage {
	/**
	 * profile content for active menu item
	 * @var	string
	 */
	public $profileContent = '';
	
	/**
	 * @see wcf\page\AbstractPage::$templateName
	 */
	public $templateName = 'user';
	
	/**
	 * user id
	 * @var integer
	 */
	public $userID = 0;
	
	/**
	 * user object
	 * @var wcf\data\user\User
	 */
	public $user = null;
	
	/**
	 * @see wcf\page\IPage::readParameters()
	 */
	public function readParameters() {
		parent::readParameters();
		
		if (isset($_REQUEST['id'])) $this->userID = intval($_REQUEST['id']);
		$this->user = new User($this->userID);
		if (!$this->user->userID) {
			throw new IllegalLinkException();
		}
	}
	
	public function readData() {
		parent::readData();
		
		$activeMenuItem = UserProfileMenu::getInstance()->getActiveMenuItem();
		$contentManager = $activeMenuItem->getContentManager();
		$this->profileContent = $contentManager->getContent();
	}
	
	/**
	 * @see wcf\page\IPage::assignVariables()
	 */
	public function assignVariables() {
		parent::assignVariables();
		
		WCF::getTPL()->assign(array(
			'profileContent' => $this->profileContent,
			'userID' => $this->userID,
			'user' => $this->user
		));
	}
}
