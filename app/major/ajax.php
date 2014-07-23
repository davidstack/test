<?php
/*
专业的增删改查
*/
define('IN_AJAX', TRUE);

if (!defined('IN_ANWSION'))
{
	die;
}

class ajax extends AWS_CONTROLLER
{
	public function get_access_rule()
	{
		$rule_action['rule_type'] = 'white';

		$rule_action['actions'] = array(
				'query_list'
		);

		return $rule_action;
	}

	public function setup()
	{
		HTTP::no_cache_header();
	}
	
	
	/**
	 * query articles or teachers by majorid
	 */
	public function query_list_action()
	{
		
		switch ($_GET['type'])
		{
			case 'teacher':
				$action_list = $this->model('lbuser')->get_teachers_by_major_id($_GET['major_id'], intval($_GET['page']) * get_setting('contents_per_page') . ', ' . get_setting('contents_per_page'));
			break;
			
			case 'article':
				$action_list = $this->model('article')->get_article_list_by_major_id($_GET['major_id'],  intval($_GET['page']) * get_setting('contents_per_page') . ', ' . get_setting('contents_per_page'));
			break;
		}
		
		TPL::assign('list', $action_list);
		
		
		if ($_GET['type'] == 'article')
		{
			TPL::output('major/ajax/article_list');
		}
		else
		{
			TPL::output('major/ajax/teacher_list');
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 根据专业名称、学校名称获取 该专业相关的老师信息
	 */
	public function get_majors_action()
	{
		
		if ($majors_info = $this->model('major')->get_major_detail_by_name_school($_GET['major_name'],$_GET['school_name'], 18))
		{	
			foreach($majors_info as $key => $val)
			{
				$teachers_info=$this->model('lbuser')->get_teachers_by_major($val['major_name']);
				
				/**
				 * 根据专业查询老师，整理老师数据
				 */
				foreach ($teachers_info as $key1=>$teacher_val)
				{
					$focus_teachers_by_major[$key1] = array(
							'user_id'=>$teacher_val['id'],
							'teacher_name' => $teacher_val['name'],
							'school_name' =>$teacher_val['school_name'],
							'desc'=>$teacher_val['desc'],
							'major_score'=>$teacher_val['score'],
							'attertion'=>$teacher_val['attention']
							
							);
				}
			}
		}
	
		H::ajax_json_output($focus_teachers_by_major);
	}
	
	/*
	 *根据老师ID 进入老师主页
	 */
	public function get_teacher_detail_by_name()
	{
		
	}
	/**
	 * 获取系统中的专业和学校信息
	 */
	public function get_major_list()
	{
		
	}
}