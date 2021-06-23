module RTC(
    input               clk,
    input               rst_n,
    input       [4:0]   initial_time_hh,
    input       [5:0]   initial_time_mm,
    input               initial_time_valid,
    output  reg [4:0]   hh,
    output  reg [5:0]   mm
);
parameter   CLK_DIV_RATIO = 1;

reg     [5:0]   hh_cnt;
reg     [5:0]   mm_cnt;
reg             mm_full;
reg             hh_full;
reg             clk_div;
reg     [31:0]  cnt;


always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        clk_div<=0;
        cnt<=0;
    end
    else begin
        if(cnt<CLK_DIV_RATIO)
        begin
            cnt<=cnt+1;
        end
        else
        begin
            cnt<=0;
            clk_div<=~clk_div;
        end
        
    end
end

always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        mm<=0;
        hh<=0;
    end
    else begin
        if(initial_time_valid)
        begin
            hh<=initial_time_hh;
            mm<=initial_time_mm;
        end
        
    end
end


always @(posedge clk_div or negedge rst_n) begin
    if(!rst_n)
    begin
        mm<=0;
        hh<=0;
    end
    else begin
            if(mm_full)
            begin
                if(mm<6'd59)
                begin
                    mm=mm+1;
                end
                else
                begin
                    mm=0;
                    if(hh==6'd23)
                    begin
                        hh=0;
                    end
                    else
                    begin
                        hh=hh+1;
                    end
                end
            end
    end
end

always@(posedge clk_div or negedge rst_n)
begin
    if(!rst_n)
    begin
        mm_full<=0;
        mm_cnt<=0;
    end
    else
    begin
//        if(clk_div)
//        begin
            if(mm_cnt<6'd59)
            begin
                mm_cnt<=mm_cnt+1;
                mm_full<=0;
            end
            else
            begin
                mm_cnt<=0;
                mm_full<=1;
            end
//        end
    end
end


endmodule