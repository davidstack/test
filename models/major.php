<?php
/**
 *  查询专业信息，查询老师信息
 */
if (!defined('IN_ANWSION'))
{
	die;
}
class major_class extends AWS_MODEL
{
	
	/**
	 * 根据专业名称获取专业信息
	 * @param unknown_type $major_name
	 * @param unknown_type $school_name
	 */
	public function get_major_detail_by_name_school($major_name, $school_name)
	{
		if (sizeof($school_name) == 0 AND sizeof($major_name) == 0)
		{
			return false;
		}
	
		if(sizeof($school_name) != 0 AND sizeof($major_name) != 0)
		{
			$majors_list = $this->fetch_all('majors', "major_name=".$major_name."AND school_name=". intval($school_name));
		    return $majors_list;
		}
		
		return false;
	}
	/**
	 * 根据名称查询专业
	 * @param unknown_type $number  346804703  
	 */
	public function get_hot_majors($number=1,$major_name=null,$schoole_name=null)
	{
		// 查询指定数量的 专业
		if(is_null($major_name)&&is_null($schoole_name))
		{
			$majors_list=$this->fetch_all('majors', null,"temperature desc",$number,null);
		}
		else if(!is_null($major_name)&&is_null($schoole_name))
		{
			$majors_list=$this->fetch_all('majors', "major_name like %". $major_name."% ");
		}
		else if(is_null($major_name)&&!is_null($school_name))
		{
			$majors_list=$this->fetch_all('majors', "school_name like %". $school_name."% ");
		}
		else
		{
			$majors_list=$this->fetch_all('majors', "major_name like %". $major_name."%  and "."school_name like %". $school_name."% ");
		}
		
		return $majors_list;
	}
	/**
	 * 根据专业ID查询专业的具体信息
	 * @param unknown_type $major_id
	 */
	public function get_major_detail($major_id)
	{
		$major_detail=$this->fetch_row('majors', "id=". intval($major_id),null);
		
		$major_detail_page= array(
					'major_id'=>$major_detail['id'],
					'major_name' => $major_detail['major_name'],
					'school_name' => $major_detail['school_name'],
					'url_token' =>$major_detail['major_url'],
					'discuss_count'=>$major_detail['discuss_count'],
					'focus_count'=>$major_detail['focus_count'],
					'desc'=>$major_detail['desc'],
					'company'=>$major_detail['companies'],
					'rank'=>$major_detail['country_paiming'],
					'temperature'=>$major_detail['temperature']
			);
		return $major_detail_page;
	}

	
}