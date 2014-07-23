<?php
class main extends AWS_CONTROLLER
{
	public function get_access_rule()
	{
		$rule_action['rule_type'] = "white"; //'black'黑名单,黑名单中的检查  'white'白名单,白名单以外的检查
	
		//if ($this->user_info['permission']['visit_explore'] AND $this->user_info['permission']['visit_site'])
	//	{
			$rule_action['actions'] = array(
			'index',
			'list'
		);
		//}
	
		return $rule_action;
	}
	/**
	 * 需要显示的action
	 */
	public function index_action()
	{
		/**
		 * 根据专业查询老师
		 */
		
		if($_GET['tag']=='major')
		{
			if ($majors_info = $this->model('major')->get_major_detail_by_name_school($_GET['major_name'],$_GET['school_name'], 18))
			{
				foreach($majors_info as $key => $val)
				{
					$teachers_info=$this->model('lbusers')->get_teachers_by_major($val['major_name']);

					/**
					 * 根据专业查询老师，整理老师数据
					 */
					foreach ($teachers_info as $key=>$teacher_val)
					{
						$focus_teachers_by_major[$key] = array(
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

			TPL::assign('title','老师信息');
			TPL::assign('teachers_list', $focus_teachers_by_major);
			return;
		}
		else {
			 //默认的查询专业
			$majors_info = $this->model('major')->get_hot_majors(20);
			if (!isset($majors_info)) 
			{
				return;
			}
			echo count($majors_info).'<br />';
			foreach($majors_info as $key => $val)
			{
				$majors_list[$key] = array(
						'major_id'=>$val['id'],
						'major_name' => $val['major_name'],
						'school_name' => $val['school_name'],
						'url_token' =>$val['id'],
						'discuss_count'=>$val['discuss_count'],
						'focus_count'=>$val['focus_count']
				);
			}
			TPL::assign('title','专业信息');
			TPL::assign('majors_list', $majors_list);
		}
		$_GET['id'] = 'hot';
		TPL::import_js('js/ajaxupload.js');
		TPL::output('major/index');
	}
	
	/**
	 * 根据专业ID，查询该专业的信息，包括该专业的详情、专业相关的老师、专业相关的文章
	 */
	public function list_action()
	{
		if(!isset($_GET['id']))
		{
			echo  "major id is empty";
		}
		
		$major_id=$_GET['id'];
		
		#echo "majroid=".$major_id;
		// the detail of this major
		$major_detail_page=$this->model('major')->get_major_detail($major_id);

		//teachers of this major
		$major_teachers_page=$this->model('lbuser')->get_teachers_by_major_id($major_id);
			
		foreach ($major_teachers_page as $key=>$val)
		{
			echo $val['user_name'];
	    }	
		/**
		 * articles of this major
		 */
		$major_articles_page=$this->model('article')->get_articles_by_major_id($major_id);
		
	
		TPL::assign('teachers_list',$major_teachers_page);
		TPL::assign('all_teachers_list_bit', TPL::output('major/ajax/teacher_list', false));
		
		TPL::assign('articles_list',  $major_articles_page);
		TPL::assign('all_articles_list_bit', TPL::output('major/ajax/article_list', false));
		
		#echo "major_name=".$major_detail_page['major_name'];
		 TPL::assign('major_detail_page', $major_detail_page);
		 TPL::assign('major_teachers_page', $major_teachers_page);
		 TPL::assign('major_articles_page', $major_articles_page);
// 		
		TPL::import_js('js/ajaxupload.js');
		TPL::output('major/list');
		
	}
}