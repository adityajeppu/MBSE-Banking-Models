for i = 1:3
    d = round(rand(3,1)*30);
    tr = round((rand(3,1)*2-1)*10);
    from = round(rand(3,1)*2+1);
    To = round(rand(3,1)*2+1);
    flg = [0;0;0];
    Tp = round(rand(3,1)*3);
    co = round(rand(3,1)*6 + 1);
    tim = round(rand(3,1)*10);

    fp = fopen("inp.txt", "w+");
    fprintf(fp, "%f,%f,%f,", d(1), d(2), d(3));
    fprintf(fp, "%f,%f,%f,", tr(1), tr(2), tr(3));
    fprintf(fp, "%f,%f,%f,", from(1), from(2), from(3));
    fprintf(fp, "%f,%f,%f,", To(1), To(2), To(3));
    fprintf(fp, "%d,%d,%d,", flg(1), flg(2), flg(3));
    fprintf(fp, "%hd,%hd,%hd,", co(1), co(2), co(3));
    fprintf(fp, "%f,%f,%f,", Tp(1), Tp(2), Tp(3));
    fprintf(fp, "%d,%d,%d\n", tim(1), tim(2), tim(3));
    fclose(fp);

    sim("main_SLDV_C_compare_test_2020.slx")
    !/media/ayj/Data/E/Adi/4th\ year/8th\ sem/Design_verifier/Subsystem_discrete_updated_ert_rtw/a.out

    a = load("out.txt");
    if(sum(sum(a-simout)) == 0)
        disp([num2str(i) ' passed']);
    else
        disp([num2str(i) ' failed']);
    end
    eval(['!mv inp.txt testin' num2str(i) '.txt'])
    eval(['!mv out.txt testout' num2str(i) '.txt'])
    
end