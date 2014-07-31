<?php
/**
 * 老师或者学生的信息处理
 */
if (!defined('IN_ANWSION'))
{
	die;
}

class school_class extends AWS_MODEL
{
	public function get_school_id($school_name)
	{
		$result= $this->query_row("select id from aws_lb_school where name ="."'".$school_name."'");
		return $result['id'];
	}
}