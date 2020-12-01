classdef QuadPlotSimple < handle
    %QUADPLOT Visualization class for quad

    properties (SetAccess = public)
        k = 0;
        qn;             % quad number
        time = 0;       % time
        state;          % state
        des_state;      % desried state [x; y; z; xdot; ydot; zdot];

        color;          % color of quad
        wingspan;       % wingspan
        height;         % height of quad

        state_hist        % position history
        state_des_hist;   % desired position history
        time_hist;      % time history
        max_iter;       % max iteration
        
    end

    properties (SetAccess = private)
        h_3d
        h_qz;   % z axis of quad handle
        h_qn;   % quad number handle
        h_pos_hist;     % position history handle
        h_pos_des_hist; % desired position history handle
        text_dist;  % distance of quad number to quad
    end

    methods
        % Constructor
        function Q = QuadPlotSimple(qn, state, wingspan, height, color, max_iter, h_3d)
            Q.qn = qn;
            Q.state = state;
            Q.wingspan = wingspan;
            Q.color = color;
            Q.height = height;
            Q.text_dist = Q.wingspan / 3;
            Q.des_state = Q.state(1:3);

            Q.max_iter = max_iter;
            Q.state_hist = zeros(3, max_iter);
            Q.state_des_hist = zeros(3, max_iter);
            Q.time_hist = zeros(1, max_iter);
            
            % Initialize plot handle
            if nargin < 7, h_3d = gca; end
            Q.h_3d = h_3d;
            hold(Q.h_3d, 'on')
            Q.h_pos_hist = plot3(Q.h_3d, Q.state(1), Q.state(2), Q.state(3),'.', 'color', Q.color, 'linewidth',4);
            %Q.h_pos_des_hist = plot3(Q.h_3d, Q.des_state(1), Q.des_state(2), Q.des_state(3), 'b.');
            hold(Q.h_3d, 'off')
        end

        % Update quad state
        function UpdateQuadState(Q, state, time)
            Q.state = state;
            Q.time = time;
        end

        % Update desired quad state
        function UpdateDesiredQuadState(Q, des_state)
            Q.des_state = des_state;
        end

        % Update quad history
        function UpdateQuadHist(Q)
            Q.k = Q.k + 1;
            Q.time_hist(Q.k) = Q.time;
            Q.state_hist(:,Q.k) = Q.state(1:3);
            %Q.state_des_hist(:,Q.k) = Q.des_state(1:3);
        end

        % Update quad plot
        function UpdateQuadPlot(Q, state, des_state, time)
            Q.UpdateQuadState(state, time);
            Q.UpdateDesiredQuadState(des_state);
            Q.UpdateQuadHist();
            set(Q.h_qn, 'Position', ...
                [Q.state_hist(1,1:Q.k), ...
                Q.state_hist(2,1:Q.k), ...
                Q.state_hist(3,1:Q.k)]);
        % 历史记录
            set(Q.h_pos_hist, ...
                'XData', Q.state_hist(1,1:Q.k), ...
                'YData', Q.state_hist(2,1:Q.k), ...
                'ZData', Q.state_hist(3,1:Q.k));
            set(Q.h_pos_des_hist, ...
                'XData', Q.state_des_hist(1,1:Q.k), ...
                'YData', Q.state_des_hist(2,1:Q.k), ...
                'ZData', Q.state_des_hist(3,1:Q.k));
            drawnow;
        end
    end

end
