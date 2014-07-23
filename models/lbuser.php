<?php
/**
 * 老师或者学生的信息处理
 */
if (!defined('IN_ANWSION'))
{
	die;
}

class lbuser_class extends AWS_MODEL
{
	/**
	 * 获取考取该专业老师的信息
	 * @param unknown_type $major_id
	 */
	public function get_teachers_by_major_id($major_id,$limit=20)
	{
		if(empty($major_id))
		{
			return false;
		}
		$major_teachers=$this->fetch_all('lbuser_detail', "major_id=". $major_id,'hot_rank DESC', $limit);
		
		 foreach ($major_teachers as $key=>$val)
		{
			$teacher_detail=$this->fetch_row('users',"uid=".$val['id']);
			$major_teachers[$key]['user_name']=$teacher_detail['user_name'];
		 }
		
		foreach($major_teachers as $key1 => $val1)
		{
			$major_teachers_page[$key1] = array(
					'name'=>$val1['user_name'],
					'uid'=>$val1['id'],
					'score' => $val1['score'],
					'rank' => $val1['hot_rank'],
					'url_token' =>$val1['id'],// 用户ID
					'desc'=>$val1['desc'] //个人简介
			);
		}
		return $major_teachers_page;
	}	
}