package org.jeecgframework;

import com.google.gson.Gson;
import org.junit.Test;

import java.util.Map;

/**
 * Created by Administrator on 2018/3/15.
 */
public class TestGson {

    @Test
    public void test(){
        Gson gson = new Gson();
        Map map = gson.fromJson("{\"上架\":\"1\",\"下架\":\"0\"}", Map.class);

        System.out.println(map);
    }
}
