package org.edc.cdtu.yz.controller;

import org.edc.cdtu.yz.query.WorkQuery;
import org.edc.cdtu.yz.service.IWorkService;
import org.edc.cdtu.yz.bean.Work;
import org.edc.cdtu.yz.util.AjaxResult;
import org.edc.cdtu.yz.util.PageList;
import com.baomidou.mybatisplus.plugins.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/work")
public class WorkController {
    @Autowired
    public IWorkService workService;

    /**
     * 保存、修改 【区分id即可】
     * @param work  传递的实体
     * @return Ajaxresult转换结果
     */
    @RequestMapping(value="/save",method= RequestMethod.POST)
    public AjaxResult save(@RequestBody Work work){
        try {
            if(work.getId()!=null){
                    workService.updateById(work);
            }else{
                    workService.insert(work);
            }
            return AjaxResult.me();
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.me().setMessage("保存对象失败！"+e.getMessage());
        }
    }

    //删除对象信息
    @RequestMapping(value="/{id}",method=RequestMethod.DELETE)
    public AjaxResult delete(@PathVariable("id") Long id){
        try {
            workService.deleteById(id);
            return AjaxResult.me();
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.me().setMessage("删除对象失败！"+e.getMessage());
        }
    }

    //获取用户
    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    public Work get(@PathVariable("id")Long id)
    {
        return workService.selectById(id);
    }


    //查看所有的员工信息
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public List<Work> list(){
        return workService.selectList(null);
    }


    /**
    * 分页查询数据：
    * @param query 查询对象
    * @return PageList 分页对象
    */
    @RequestMapping(value = "/json",method = RequestMethod.POST)
    public PageList<Work> json(@RequestBody WorkQuery query) {
        Page<Work> page = new Page<Work>(query.getPage(),query.getRows());
        page = workService.selectPage(page);
        return new PageList<Work>(page.getTotal(),page.getRecords());
    }
}
