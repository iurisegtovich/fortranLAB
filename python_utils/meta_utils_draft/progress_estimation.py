

def progress_estimation():
#actually callable or just copiable?

    Fans=np.zeros([NP])

    param_l0=np.zeros([ndim])
    param_l=np.zeros([ndim])

    #for l in ran#ge(1):
    #for l in range(10):
    #for l in range(100):
    import time
    begintime = time.time()
    print(NP)
    begin=(idn-1)*divmod(NP,of)[0]

    if idn < of:
        end=(idn)*divmod(NP,of)[0]
    else:
        end=NP

    begintask=begin
    endtask=end

    for l in range(begin,end):
        #determine parameter set P corresponding to NNN[i]
        for i in range(ndim):

            #1 --- pmax
            #NNN - param_l
            #0 --- pmin

            #1/(max-min) == NNN/(param_l-min)

            #param_l[i] = pmin[i] + NNN[l][i,0]*(pmax[i]-pmin[i])
            param_l[i] = NNN[l][i,0]

        #calc FOBJ with base point P -- use FOBJ with TRIM feature enabled
        # and record FOBJ into array(NP)

        Fans[l] = objfun_impl(param_l,file1)[0]
        #print(Fans[l])

        min_funobj = np.inf
        if Fans[l] < min_funobj:
            min_funobj = Fans[l]
            opt_param  = param_l    

        #print basepoint and FOBJ into file
        nowtime = time.time()
        nowtask = l

        elapsedtime=nowtime-begintime
        elapsedtask=nowtask-begintask

        #totaltask=endtask-begintask

        #prediction=(NP)*sofar/(l-begin+1) - sofar

        #begin -begin
        #sofar -sofar
        #end -end

        #endtime-begintime / endtasks-begintasks = sofartinme-begintinme/sofartask-begintask
        #endtime = begintime +  endtasks-begintasks  *  () sofartime-begintinme/sofartask-begintask )
        endtime = begintime +  (endtask-begintask)  * (nowtime-begintime)/(nowtask-begintask+1)
        remainingtime = endtime-begintime-elapsedtime

        file_4.write(repr((l,
                          "(",100*(nowtask-begintask)/(endtask-begintask+1),"%)",
                          Fans[l],elapsedtime,"elapsed (s)",(endtime-begintime)/3600,"estimated (h)",remainingtime/3600,"remaining (h)")))
        file_4.write('\n')
        file_4.flush()

    file1.close()    
    file_4.close()
    
    print('done'+str(idn)+'/'+of)
