package cn.liu.main.web;

import cn.liu.service.GoogleTranslate;
import com.alibaba.druid.support.json.JSONUtils;
import dev.xwolf.framework.common.util.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by liuf on 2016/9/3.
 */
@Controller
public class indexController {
    @RequestMapping("index")
    public String index(Model model){
        return "index";
    }

    @RequestMapping("translate")
    @ResponseBody
    public String translate(Model model,String word,String from,String to){
        if(StringUtils.isNullOrEmpty(word)){
            return "1";
        }
        String text=GoogleTranslate.translate(word,from,to);
        return text;
    }

    @RequestMapping("game")
    public String game(){
        return "game";
    }
}
